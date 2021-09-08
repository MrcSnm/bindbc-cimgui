module dostuff;

import std.string;
import std.file;
import std.path;
import std.range;
import std.algorithm;
import std.process;
import std.getopt;
import std.experimental.logger;

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

auto _exec(string[] args, string workingDirectory = null)
{
    string cmd = escapeShellCommand(args);
    log(cmd);
    return executeShell(cmd, null, Config.none, size_t.max, workingDirectory, nativeShell);
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
    // pragma(msg, getoptMixin());
    mixin(getoptMixin());
    if (helpInformation.helpWanted)
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

        log("Dpp written to " ~ op.dppExecutablePath);
    }

    if (op.compileImgui)
    {
        string outputDirectory = imguiCompilationWorkflow();

        if (!outputDirectory)
            return 1;
        
        log("Imgui binaries written to " ~ outputDirectory);
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
string gitClone(string repoUrl, string branch = null)
{
    // `a/b/name` gives us `name`
    string repoName = repoUrl.takeAfterLast("/");
    string repoPath = buildPath(op.tempDirectory, repoName);
    if (exists(repoPath))
    {
        log("Found " ~ repoName ~ " clone at " ~ repoPath ~ ", skipping cloning.");
        return repoPath;
    }

    string[] args = ["git", "clone", "--recursive", repoUrl];
    if (branch)
    {
        args ~= "--branch=" ~ branch;
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

string imguiCompilationWorkflow()
{
    const imguiRepoUrl = "https://www.github.com/cimgui/cimgui";
    const imguiCommitHash = "";
    const imguiBranch = "docking_inter";

    if (!checkCommandsExist(["git", "cmake"]))
        return null;
    
    // TODO: Clone a specific hash per version?
    const imguiClonedRepoPath = gitClone(imguiRepoUrl, imguiBranch);
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
    log("The output of imgui compilation should be in " ~ outputDirectory);
    
    return outputDirectory;
}


void generateBindingsWorkflow()
{
    assert(0, "TODO: Not yet implemented");
    // The steps:
    // 1. Clone the generator if not yet provided.
    // 2. Clone cimgui if it is not found in the temp directory.
    // 3. Invoke the generator with the command from `generate/generate.bat`.
    //
    // I have already parametrized the plugins folder path, the temp folder path and the dpp path.
    // We should make it not depend on its position in the source tree.
    // We should allow to pass output folder as argument.


    // string generatorExecutable;
    // string generatorFolder;
    // if (op.generatorRepoPath)
    // {
    //     generatorFolder = op.generatorRepoPath;
    // }
    // else
    // {
    //     generatorFolder   
    // }

    // version (Windows)
    // {
    //     generatorExecutable = buildPath(generatorFolder, "bin", "bindbc-generator.exe");
    // }
    // else
    // {
    //     assert(0, "Non-windows not supported yet");
    // }
}