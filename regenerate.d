module regenerate;

import std.string;
import std.file;
import std.path;
import std.range;
import std.algorithm;
import std.process;
import std.getopt;
import std.experimental.logger;
import std.stdio : writeln;

struct Options
{
    @("Path to temporary directory, `temp` by default.") 
    string tempDirectory;

    @("Path to d++ executable. Only needed when doing bindings. Found in path if not provided.") 
    string dppExecutablePath;

    @("Path to bindbc generator. Only needed when doing bindings.") 
    string generatorRepoPath;

    @("Path to `cimgui.h`.")
    string cimguiHeaderPath;

    @("Whether to get cimgui from github and compile into a dll and lib.")
    bool compileImgui;

    @("Whether to regenerate bindbc-cimgui bindings using the generator.")
    bool generateBindings;
    
    @("Whether to get dpp from github and compile it.")
    bool compileDpp;
}

__gshared Options op;
__gshared bool hasErrors;

void _error(string message)
{
    hasErrors = true;
    error(message);
}

int main(string[] args)
{
    string getoptMixin()
    {
        auto ret = "auto helpInformation = getopt(args";
        static foreach (field; Options.tupleof)
        {
            import std.format;
            ret ~= `, "%s", "%s", &op.%1$s`.format(__traits(identifier, field), __traits(getAttributes, field)[0]);
        }
        ret ~= ");";
        return ret;
    }
    mixin(getoptMixin());

    if (helpInformation.helpWanted || op == Options.init)
    {
        defaultGetoptPrinter("Help message", helpInformation.options);
        return 0;
    }

    void ensurePathExistsIfProvided(string name, string path)
    {
        if (path && !exists(path))
        {
            _error(name ~ " not found by the specified path " ~ path);
        }
    }
    ensurePathExistsIfProvided("Dpp", op.dppExecutablePath);
    ensurePathExistsIfProvided("Generator", op.generatorRepoPath);
    ensurePathExistsIfProvided("cimgui header", op.cimguiHeaderPath);

    if (op.compileDpp && op.dppExecutablePath)
    {
        _error("Incompatible arguments: `compileDpp` and `dppExecutablePath`");
    }

    if (op.compileImgui && op.cimguiHeaderPath)
    {
        _error("Incompatible arguments: `compileImgui` and `cimguiHeaderPath`");
    }

    op.tempDirectory = absolutePath(op.tempDirectory ? op.tempDirectory : "temp");
    mkdirRecurse(op.tempDirectory);

    if (hasErrors)
        return 1;

    if (op.compileDpp)
    {
        op.dppExecutablePath = dppCompilationWorkflow();

        if (!op.dppExecutablePath)
            return 1;

        log("Dpp has been written to " ~ op.dppExecutablePath);
    }

    if (op.compileImgui)
    {
        string outputDirectory = imguiCompilationWorkflow();

        if (!outputDirectory)
            return 1;
        
        log("Imgui binaries have been written to " ~ outputDirectory);
    }

    if (op.generateBindings)
    {
        generateBindingsWorkflow();
    }

    return hasErrors ? 1 : 0;
}

string takeAfterLast(string str, string pattern)
{
    auto index = lastIndexOf(str, pattern);
    return str[index + 1..$];
}

// Returns the path to the cloned repo
string gitClone(string repoUrl, bool recursive = true, string branch = null)
{
    // `a/b/name` gives us `name`
    string repoName = repoUrl.takeAfterLast("/");
    string repoPath = buildPath(op.tempDirectory, repoName);
    if (exists(repoPath))
    {
        log("Found " ~ repoName ~ " clone at " ~ repoPath ~ ", skipping cloning.");
        return repoPath;
    }

    string[] args = ["git", "clone", repoUrl];
    if (branch)
    {
        args ~= "--branch=" ~ branch;
    }
    if (recursive)
    {
        args ~= "--recursive";
    }

    auto result = _exec(args, op.tempDirectory);
    if (result.status == 0)
        return repoPath;

    _error("Failed to clone " ~ repoName ~ ": " ~ result.output);
    return null;
}

string dppCompilationWorkflow()
{
    const dppRepoUrl = "https://github.com/atilaneves/dpp";
    log("You will need to install LLVM if it's not installed already, see the dpp repo: " ~ dppRepoUrl);
    
    if (!checkCommandsExist(["git", "dub"]))
        return null;

    const dppClonedRepoPath = gitClone(dppRepoUrl);
    if (!dppClonedRepoPath)
        return null;

    const result = _exec(["dub", "build"], dppClonedRepoPath);
    if (result.status != 0)
    {
        _error("Failed to build dpp: " ~ result.output);
        return null;
    }

    string dppExecutablePath;
    version (Windows)
    {
        dppExecutablePath = buildPath(dppClonedRepoPath, "bin/d++.exe");
        if (!exists(dppExecutablePath))
        {
            _error("Expected d++ at " ~ dppExecutablePath);
        }
    }
    return dppExecutablePath;
}

string gitCloneImgui()
{
    const repoUrl = "https://www.github.com/cimgui/cimgui";
    const commitHash = null;//"a97c90ec4f32a5938dba3e1141827efad4efaa00";
    const branch = "docking_inter";
    const recursive = false;

    const clonedRepoPath = gitClone(repoUrl, recursive, branch);
    if (!clonedRepoPath)
        return null;

    if (commitHash)
    {
        auto result = _exec(["git", "checkout", commitHash], clonedRepoPath);
        if (result.status != 0) return null;
    }
    
    // result = _exec(["git", "submodule", "init"], clonedRepoPath);
    // if (result.status != 0) return null;

    auto result = _exec(["git", "submodule", "update", "--init", "--recursive"], clonedRepoPath);
    if (result.status != 0) return null;
    
    return clonedRepoPath;
}

string imguiCompilationWorkflow()
{
    if (!checkCommandsExist(["git", "cmake"]))
        return null;
    
    const imguiClonedRepoPath = gitCloneImgui();
    if (!imguiClonedRepoPath)
        return null;

    // cmake -Hcimgui -Bbuild -DCMAKE_BUILD_TYPE=RelWithDebInfo
    const imguiBuildDirectory = "imgui_build";
    const configuration = "RelWithDebInfo";
    auto result = _exec(
        ["cmake", "-Hcimgui", "-B" ~ imguiBuildDirectory, "-DCMAKE_BUILD_TYPE=" ~ configuration], op.tempDirectory);
    if (result.status != 0)
    {
        _error("Failed to run cmake: " ~ result.output);
        return null;
    }

    // cmake --build build --config RelWithDebInfo
    result = _exec(["cmake", "--build", imguiBuildDirectory, "--config", configuration], op.tempDirectory);
    if (result.status != 0)
    {
        _error("Failed to run cmake build: " ~ result.output);
        return null;
    }

    // The output should be in RelWithDebInfo
    const outputDirectory = buildPath(op.tempDirectory, "build", configuration);
    return outputDirectory;
}


void generateBindingsWorkflow()
{
    if (!checkCommandsExist(["git", "dub"]))
        return;

    string generatorRepoPath;
    if (op.generatorRepoPath)
    {
        generatorRepoPath = op.generatorRepoPath;
    }
    else
    {
        generatorRepoPath = gitClone("https://github.com/MrcSnm/bindbc-generator");
        if (!generatorRepoPath) 
            return;
    }

    string imguiPath;
    string cimguiHeaderPath;
    if (op.cimguiHeaderPath)
    {
        imguiPath = dirName(op.cimguiHeaderPath);
        cimguiHeaderPath = op.cimguiHeaderPath;
    }
    else
    {    
        imguiPath = gitCloneImgui();
        if (!imguiPath)
            return;
        cimguiHeaderPath = buildPath(imguiPath, "cimgui.h");
    }


    string cimguiPluginGenPath = buildPath(generatorRepoPath, "bindbc/cimgui");
    auto generatorArgs = [
        "dub", "--", 
        "--recompile", "--load-all", 
        "--file", cimguiHeaderPath, 
        "--temp-path", op.tempDirectory, 
        "--presets", "cimgui"
    ];
    if (op.dppExecutablePath)
    {
        generatorArgs ~= "--dpp-path";
        generatorArgs ~= op.dppExecutablePath;
    }

    string argumentsString = escapeShellCommand(generatorArgs);
    
    // We need to append the plugin arguments as strings, since otherwise they get escaped
    // and the default parser in the generator cannot deal with that.
    argumentsString ~= ` --plugin-args cimgui-overloads="[%s, %s, %s]"`.format(imguiPath, cimguiPluginGenPath, "d-conv");
    log(argumentsString);
    
    auto result = executeShell(argumentsString, null, Config.none, size_t.max, generatorRepoPath);
    if (result.status != 0)
    {
        _error("Failed to apply the generator: ");
        writeln(result.output);
        return;
    }
    writeln(result.output);

    log("Find the output files somewhere in " ~ generatorRepoPath ~ " and in here " ~ cimguiPluginGenPath);
}


// void copyTree(string fromPath, string toPath)
// {
//     foreach (f
// }

auto _exec(string[] args, string workingDirectory = null)
{
    string cmd = escapeShellCommand(args);
    log(cmd);
    return execute(args, null, Config.none, size_t.max, workingDirectory);
}

bool existsCommand(string command)
{
    version (Windows)
    {
        return executeShell(escapeShellCommand(["where", command])).status == 0;
    }
    assert(0, "Linux and the alike are not implemented");
}

bool checkCommandsExist(string[] commands)
{
    foreach (command; commands)
    {
        if (!existsCommand(command))
        {
            _error("`" ~ command ~ "` not found in path");
        }   
    }
    return !hasErrors;
}