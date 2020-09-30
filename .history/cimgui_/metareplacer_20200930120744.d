module cimgui_.metareplacer;



//---------------------------------------------------------
//C Specific to D - Start
//---------------------------------------------------------
//cimgui_api regex substiture unsgined int for uint

//          UINT
///Search Value: unsigned int
//Replace Value: uint

//          UBYTE
///Search Value: unsigned char
//Replace Value: ubyte


//          STRING
///Search Value: const char*
//Replace Value: const (char)*

//           HEAD CONST
///Search Value: const\s([\w*]+?)\sconst
//Replace Value: const $1


//             CALLBACK
///Search Value: (?<ReturnValue>[\w*]+?)\(\*(?<CbName>[\s\S]+?)\)\((?<Params>[\s\S]+?)\)
//Replace Value: ${ReturnValue} function(${Params}) ${CbName}
//Replace Value²: $1 function($3) $2

//        IN          
///Search Value: in\s
//Replace Value: in_

//        OUT
///Search Value: \sout\b
//Replace Value:  out_

//        ARRAYS
///Search Value: (?<Type>(?:const\s)?\w+?*?\s+?)(\w+?\[\])

//--------------------------------------------------------
//C Specific to D - End
//--------------------------------------------------------



//Replace cimgui_API regex alias creation
///Search value: CIMGUI_API\s((?:const\s)?[\w*]+)\s+?(\w+)
//Replace value: alias da_$2 = $1 function


//cimgui_api regex __gshared def
///Search Value: CIMGUI_API\s(?<type>(?:const\s)?[\w*]+)\s(?<fname>\w+)[\S\s]+?\);
//Replace Value: da_$2 $2;


//cimgui_api regex bindSymbol
///Search Value: CIMGUI_API\s(?<type>(?:const\s)?[\w*]+)\s(?<fname>\w+)[\S\s]+?\);
//Replace Value: lib.bindSymbol(cast(void**)&$2, "$2");