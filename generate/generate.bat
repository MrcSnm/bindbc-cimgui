pushd .
cd ../bindbc-generator
dub -- --recompile --load-all --file="../cimgui/cimgui.h" --plugin-args cimgui-overloads="[../cimgui ../source/bindbc/cimgui2 d-conv]" --dpp-path="E:\Coding\D\dpp\bin\d++.exe" --presets="cimgui"
popd