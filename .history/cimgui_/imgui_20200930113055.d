module cimgui_.imgui;

import bindbc.loader;
import cimgui_.types;
import cimgui_.funcs;

private
{
    SharedLib lib;
}

bool loadCImGUI()
{
     version(Windows) {
        const(char)[][1] libNames = ["cimgui.dll"];
    }
    else version(OSX) {
        const(char)[][7] libNames = [
            "libcimgui.dylib",
            "/usr/local/lib/libcimgui.dylib",
            "/usr/local/lib/libcimgui/libcimgui.dylib",
            "../Frameworks/cimgui.framework/cimgui",
            "/Library/Frameworks/cimgui.framework/cimgui",
            "/System/Library/Frameworks/cimgui.framework/cimgui",
            "/opt/local/lib/libcimgui.dylib"
        ];
    }
    else version(Posix) {
        const(char)[][8] libNames = [
			"cimgui.so",
            "/usr/local/lib/cimgui.so",
            "cimgui.so.1",
            "/usr/local/lib/cimgui.so.1",
            "libcimgui.so",
            "/usr/local/lib/libcimgui.so",
            "libcimgui.so.1",
            "/usr/local/lib/libcimgui.so.1"
        ];
    }
    else static assert(0, "bindbc-cimgui is not yet supported on this platform.");

    foreach(name; libNames) 
    {
        lib = load(name.ptr);
        if(lib != invalidHandle)
            return _load();
    }
    return false;
}