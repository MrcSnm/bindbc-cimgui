# BindBC-Cimgui

BetterC bindings from [cimgui](https://github.com/cimgui/cimgui/)

This project has the implementations using BindBC-OpenGL and BindBC-SDL at the examples folder.

I tried my best to follow what @mdparker has been doing.

I made this binding with [bindbc-generator](https://github.com/MrcSnm/bindbc-generator) with some additional things that cimgui needs, found at `source/bindbc/cimgui/additional.d`.
The last easier dub packaged available version to use is [DerelicImGui](https://github.com/ExtraWurst/DerelicImGui) which is pretty old, so I made this repo that I'll be supporting for my game engine [HipremeEngine](https://github.com/MrcSnm/HipremeEngine);

The docking and master branch are supported right now, there is a switch available on `additional.d` called `CIMGUI_VIEWPORT_BRANCH`.

If you want to use the ImGui repo implementations, you can pass a callback argument to `loadcimgui` which receives a `SharedLib` which you can then take to link the symbols, they are on the example, just modify the switch on them which will be `CIMGUI_USER_DEFINED_IMPLEMENTATION`.

Version from ImGui supported right now:
## v1.79

Screenshots:

![Showing it working correctly](./example/ss.png)

Any PR's are welcome