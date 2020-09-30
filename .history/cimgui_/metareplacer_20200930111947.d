module cimgui_.metareplacer;

//Replace cimgui_API regex
///Search value: CIMGUI_API\s((?:const\s)?[\w*]+)\s+?(\w+)
//Replace value: alias da_$2 = $1 function