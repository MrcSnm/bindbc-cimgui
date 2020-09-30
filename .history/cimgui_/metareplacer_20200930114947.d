module cimgui_.metareplacer;

//Replace cimgui_API regex alias creation
///Search value: CIMGUI_API\s((?:const\s)?[\w*]+)\s+?(\w+)
//Replace value: alias da_$2 = $1 function


//cimgui_api regex __gshared def
///Search Value: CIMGUI_API\s(?<type>(?:const\s)?[\w*]+)\s(?<fname>\w+)[\S\s]+?\);
//Replace Value: da_$2 $2;

//cimgui_api regex substiture unsgined int for uint
///Search Value: unsigned int
//Replace Value: uint

///Search Value: const char*
//Replace Value: const (char)*

//cimgui_api rege substitute void pointer to func to d style func
///Search Value: (?<ReturnValue>[\w*]+?)\(\*(?<CbName>[\s\S]+?)\)\((?<Params>[\s\S]+?)\)
//Replace Value: $1 function($3) $2

///Search Value: const\s([\w*]+?)\sconst
//Replace Value: const $1


//cimgui_api regex bindSymbol
///Search Value: CIMGUI_API\s(?<type>(?:const\s)?[\w*]+)\s(?<fname>\w+)[\S\s]+?\);
//Replace Value: lib.bindSymbol(cast(void**)&$2, "$2");