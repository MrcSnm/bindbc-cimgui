module bindbc.cimgui.overloads;

import bindbc.cimgui.funcs;

static template overload(Func...)
{
    import std.traits;
    static foreach(f; Funcs)
        auto overload(Parameters!f params){
            return f(params);}
}
ImColor ImColor(){ImColor_ImColorNil();}
ImColor ImColor(int r,int g,int b,int a=255){ImColor_ImColorInt(r,g,b,a);}
ImColor ImColor(ImU32 rgba){ImColor_ImColorU32(rgba);}
ImColor ImColor(float r,float g,float b,float a=1.0f){ImColor_ImColorFloat(r,g,b,a);}
ImColor ImColor(const ref ImVec4 col){ImColor_ImColorVec4(col);}
void AddText(const ref ImVec2 pos,ImU32 col,const (char)* text_begin,const (char)* text_end= null){ImDrawList_AddTextVec2(self,pos,col,text_begin,text_end);}
void AddText(const ImFont* font,float font_size,const ref ImVec2 pos,ImU32 col,const (char)* text_begin,const (char)* text_end= null,float wrap_width=0.0f,const ImVec4* cpu_fine_clip_rect= null){ImDrawList_AddTextFontPtr(self,font,font_size,pos,col,text_begin,text_end,wrap_width,cpu_fine_clip_rect);}
ImGuiPtrOrIndex ImGuiPtrOrIndex(void* ptr){ImGuiPtrOrIndex_ImGuiPtrOrIndexPtr(ptr);}
ImGuiPtrOrIndex ImGuiPtrOrIndex(int index){ImGuiPtrOrIndex_ImGuiPtrOrIndexInt(index);}
ImGuiStoragePair ImGuiStoragePair(ImGuiID _key,int _val_i){ImGuiStoragePair_ImGuiStoragePairInt(_key,_val_i);}
ImGuiStoragePair ImGuiStoragePair(ImGuiID _key,float _val_f){ImGuiStoragePair_ImGuiStoragePairFloat(_key,_val_f);}
ImGuiStoragePair ImGuiStoragePair(ImGuiID _key,void* _val_p){ImGuiStoragePair_ImGuiStoragePairPtr(_key,_val_p);}
ImGuiStyleMod ImGuiStyleMod(ImGuiStyleVar idx,int v){ImGuiStyleMod_ImGuiStyleModInt(idx,v);}
ImGuiStyleMod ImGuiStyleMod(ImGuiStyleVar idx,float v){ImGuiStyleMod_ImGuiStyleModFloat(idx,v);}
ImGuiStyleMod ImGuiStyleMod(ImGuiStyleVar idx,ImVec2 v){ImGuiStyleMod_ImGuiStyleModVec2(idx,v);}
ImGuiTextRange ImGuiTextRange(){ImGuiTextRange_ImGuiTextRangeNil();}
ImGuiTextRange ImGuiTextRange(const (char)* _b,const (char)* _e){ImGuiTextRange_ImGuiTextRangeStr(_b,_e);}
ImGuiID GetID(const (char)* str,const (char)* str_end= null){ImGuiWindow_GetIDStr(self,str,str_end);}
ImGuiID GetID(const void* ptr){ImGuiWindow_GetIDPtr(self,ptr);}
ImGuiID GetID(int n){ImGuiWindow_GetIDInt(self,n);}
ImGuiID GetIDNoKeepAlive(const (char)* str,const (char)* str_end= null){ImGuiWindow_GetIDNoKeepAliveStr(self,str,str_end);}
ImGuiID GetIDNoKeepAlive(const void* ptr){ImGuiWindow_GetIDNoKeepAlivePtr(self,ptr);}
ImGuiID GetIDNoKeepAlive(int n){ImGuiWindow_GetIDNoKeepAliveInt(self,n);}
void Remove(ImGuiID key,const T* p){ImPool_RemoveTPtr(self,key,p);}
void Remove(ImGuiID key,ImPoolIdx idx){ImPool_RemovePoolIdx(self,key,idx);}
void Add(const ref ImVec2 p){ImRect_AddVec2(self,p);}
void Add(const ref ImRect r){ImRect_AddRect(self,r);}
bool Contains(const ref ImVec2 p){ImRect_ContainsVec2(self,p);}
bool Contains(const ref ImRect r){ImRect_ContainsRect(self,r);}
void Expand(const float amount){ImRect_ExpandFloat(self,amount);}
void Expand(const ref ImVec2 amount){ImRect_ExpandVec2(self,amount);}
ImRect ImRect(){ImRect_ImRectNil();}
ImRect ImRect(const ref ImVec2 min,const ref ImVec2 max){ImRect_ImRectVec2(min,max);}
ImRect ImRect(const ref ImVec4 v){ImRect_ImRectVec4(v);}
ImRect ImRect(float x1,float y1,float x2,float y2){ImRect_ImRectFloat(x1,y1,x2,y2);}
ImVec1 ImVec1(){ImVec1_ImVec1Nil();}
ImVec1 ImVec1(float _x){ImVec1_ImVec1Float(_x);}
ImVec2 ImVec2(){ImVec2_ImVec2Nil();}
ImVec2 ImVec2(float _x,float _y){ImVec2_ImVec2Float(_x,_y);}
ImVec2ih ImVec2ih(){ImVec2ih_ImVec2ihNil();}
ImVec2ih ImVec2ih(short _x,short _y){ImVec2ih_ImVec2ihshort(_x,_y);}
ImVec2ih ImVec2ih(const ref ImVec2 rhs){ImVec2ih_ImVec2ihVec2(rhs);}
ImVec4 ImVec4(){ImVec4_ImVec4Nil();}
ImVec4 ImVec4(float _x,float _y,float _z,float _w){ImVec4_ImVec4Float(_x,_y,_z,_w);}
bool igBeginChild(const (char)* str_id,const ref ImVec2 size=ImVec2(0,0),bool border=false,ImGuiWindowFlags flags=0){igBeginChildStr(str_id,size,border,flags);}
bool igBeginChild(ImGuiID id,const ref ImVec2 size=ImVec2(0,0),bool border=false,ImGuiWindowFlags flags=0){igBeginChildID(id,size,border,flags);}
bool igCollapsingHeader(const (char)* label,ImGuiTreeNodeFlags flags=0){igCollapsingHeaderTreeNodeFlags(label,flags);}
bool igCollapsingHeader(const (char)* label,bool* p_open,ImGuiTreeNodeFlags flags=0){igCollapsingHeaderBoolPtr(label,p_open,flags);}
bool igCombo(const (char)* label,int* current_item,const (char)* * items,int items_count,int popup_max_height_in_items=-1){igComboStr_arr(label,current_item,items,items_count,popup_max_height_in_items);}
bool igCombo(const (char)* label,int* current_item,const (char)* items_separated_by_zeros,int popup_max_height_in_items=-1){igComboStr(label,current_item,items_separated_by_zeros,popup_max_height_in_items);}
bool igCombo(const (char)* label,int* current_item,bool function(void* data,int idx,const (char)** out_text) items_getter,void* data,int items_count,int popup_max_height_in_items=-1){igComboFnBoolPtr(label,current_item,items_getter,data,items_count,popup_max_height_in_items);}
ImDrawList* igGetBackgroundDrawList(){igGetBackgroundDrawListNil();}
ImDrawList* igGetBackgroundDrawList(ImGuiViewport* viewport){igGetBackgroundDrawListViewportPtr(viewport);}
ImU32 igGetColorU32(ImGuiCol idx,float alpha_mul=1.0f){igGetColorU32Col(idx,alpha_mul);}
ImU32 igGetColorU32(const ref ImVec4 col){igGetColorU32Vec4(col);}
ImU32 igGetColorU32(ImU32 col){igGetColorU32U32(col);}
ImDrawList* igGetForegroundDrawList(){igGetForegroundDrawListNil();}
ImDrawList* igGetForegroundDrawList(ImGuiViewport* viewport){igGetForegroundDrawListViewportPtr(viewport);}
ImDrawList* igGetForegroundDrawList(ImGuiWindow* window){igGetForegroundDrawListWindowPtr(window);}
ImGuiID igGetID(const (char)* str_id){igGetIDStr(str_id);}
ImGuiID igGetID(const (char)* str_id_begin,const (char)* str_id_end){igGetIDStrStr(str_id_begin,str_id_end);}
ImGuiID igGetID(const void* ptr_id){igGetIDPtr(ptr_id);}
float igImAbs(float x){igImAbsFloat(x);}
double igImAbs(double x){igImAbsdouble(x);}
float igImFloor(float f){igImFloorFloat(f);}
ImVec2 igImFloor(const ref ImVec2 v){igImFloorVec2(pOut,v);}
float igImLengthSqr(const ref ImVec2 lhs){igImLengthSqrVec2(lhs);}
float igImLengthSqr(const ref ImVec4 lhs){igImLengthSqrVec4(lhs);}
ImVec2 igImLerp(const ref ImVec2 a,const ref ImVec2 b,float t){igImLerpVec2Float(pOut,a,b,t);}
ImVec2 igImLerp(const ref ImVec2 a,const ref ImVec2 b,const ref ImVec2 t){igImLerpVec2Vec2(pOut,a,b,t);}
ImVec4 igImLerp(const ref ImVec4 a,const ref ImVec4 b,float t){igImLerpVec4(pOut,a,b,t);}
float igImLog(float x){igImLogFloat(x);}
double igImLog(double x){igImLogdouble(x);}
float igImPow(float x,float y){igImPowFloat(x,y);}
double igImPow(double x,double y){igImPowdouble(x,y);}
float igImSign(float x){igImSignFloat(x);}
double igImSign(double x){igImSigndouble(x);}
bool igIsPopupOpen(const (char)* str_id,ImGuiPopupFlags flags=0){igIsPopupOpenStr(str_id,flags);}
bool igIsPopupOpen(ImGuiID id,ImGuiPopupFlags popup_flags){igIsPopupOpenID(id,popup_flags);}
bool igIsRectVisible(const ref ImVec2 size){igIsRectVisibleNil(size);}
bool igIsRectVisible(const ref ImVec2 rect_min,const ref ImVec2 rect_max){igIsRectVisibleVec2(rect_min,rect_max);}
void igItemSize(const ref ImVec2 size,float text_baseline_y=-1.0f){igItemSizeVec2(size,text_baseline_y);}
void igItemSize(const ref ImRect bb,float text_baseline_y=-1.0f){igItemSizeRect(bb,text_baseline_y);}
bool igListBox(const (char)* label,int* current_item,const (char)* * items,int items_count,int height_in_items=-1){igListBoxStr_arr(label,current_item,items,items_count,height_in_items);}
bool igListBox(const (char)* label,int* current_item,bool function(void* data,int idx,const (char)** out_text) items_getter,void* data,int items_count,int height_in_items=-1){igListBoxFnBoolPtr(label,current_item,items_getter,data,items_count,height_in_items);}
bool igListBoxHeader(const (char)* label,const ref ImVec2 size=ImVec2(0,0)){igListBoxHeaderVec2(label,size);}
bool igListBoxHeader(const (char)* label,int items_count,int height_in_items=-1){igListBoxHeaderInt(label,items_count,height_in_items);}
void igMarkIniSettingsDirty(){igMarkIniSettingsDirtyNil();}
void igMarkIniSettingsDirty(ImGuiWindow* window){igMarkIniSettingsDirtyWindowPtr(window);}
bool igMenuItem(const (char)* label,const (char)* shortcut= null,bool selected=false,bool enabled=true){igMenuItemBool(label,shortcut,selected,enabled);}
bool igMenuItem(const (char)* label,const (char)* shortcut,bool* p_selected,bool enabled=true){igMenuItemBoolPtr(label,shortcut,p_selected,enabled);}
void igPlotHistogram(const (char)* label,const float* values,int values_count,int values_offset=0,const (char)* overlay_text= null,float scale_min=3.40282346638528859811704183484516925e+38F,float scale_max=3.40282346638528859811704183484516925e+38F,ImVec2 graph_size=ImVec2(0,0),int stride=sizeof(float)){igPlotHistogramFloatPtr(label,values,values_count,values_offset,overlay_text,scale_min,scale_max,graph_size,stride);}
void igPlotHistogram(const (char)* label,float function(void* data,int idx) values_getter,void* data,int values_count,int values_offset=0,const (char)* overlay_text= null,float scale_min=3.40282346638528859811704183484516925e+38F,float scale_max=3.40282346638528859811704183484516925e+38F,ImVec2 graph_size=ImVec2(0,0)){igPlotHistogramFnFloatPtr(label,values_getter,data,values_count,values_offset,overlay_text,scale_min,scale_max,graph_size);}
void igPlotLines(const (char)* label,const float* values,int values_count,int values_offset=0,const (char)* overlay_text= null,float scale_min=3.40282346638528859811704183484516925e+38F,float scale_max=3.40282346638528859811704183484516925e+38F,ImVec2 graph_size=ImVec2(0,0),int stride=sizeof(float)){igPlotLinesFloatPtr(label,values,values_count,values_offset,overlay_text,scale_min,scale_max,graph_size,stride);}
void igPlotLines(const (char)* label,float function(void* data,int idx) values_getter,void* data,int values_count,int values_offset=0,const (char)* overlay_text= null,float scale_min=3.40282346638528859811704183484516925e+38F,float scale_max=3.40282346638528859811704183484516925e+38F,ImVec2 graph_size=ImVec2(0,0)){igPlotLinesFnFloatPtr(label,values_getter,data,values_count,values_offset,overlay_text,scale_min,scale_max,graph_size);}
void igPushID(const (char)* str_id){igPushIDStr(str_id);}
void igPushID(const (char)* str_id_begin,const (char)* str_id_end){igPushIDStrStr(str_id_begin,str_id_end);}
void igPushID(const void* ptr_id){igPushIDPtr(ptr_id);}
void igPushID(int int_id){igPushIDInt(int_id);}
void igPushStyleColor(ImGuiCol idx,ImU32 col){igPushStyleColorU32(idx,col);}
void igPushStyleColor(ImGuiCol idx,const ref ImVec4 col){igPushStyleColorVec4(idx,col);}
void igPushStyleVar(ImGuiStyleVar idx,float val){igPushStyleVarFloat(idx,val);}
void igPushStyleVar(ImGuiStyleVar idx,const ref ImVec2 val){igPushStyleVarVec2(idx,val);}
bool igRadioButton(const (char)* label,bool active){igRadioButtonBool(label,active);}
bool igRadioButton(const (char)* label,int* v,int v_button){igRadioButtonIntPtr(label,v,v_button);}
bool igSelectable(const (char)* label,bool selected=false,ImGuiSelectableFlags flags=0,const ref ImVec2 size=ImVec2(0,0)){igSelectableBool(label,selected,flags,size);}
bool igSelectable(const (char)* label,bool* p_selected,ImGuiSelectableFlags flags=0,const ref ImVec2 size=ImVec2(0,0)){igSelectableBoolPtr(label,p_selected,flags,size);}
void igSetScrollFromPosX(float local_x,float center_x_ratio=0.5f){igSetScrollFromPosXFloat(local_x,center_x_ratio);}
void igSetScrollFromPosX(ImGuiWindow* window,float local_x,float center_x_ratio){igSetScrollFromPosXWindowPtr(window,local_x,center_x_ratio);}
void igSetScrollFromPosY(float local_y,float center_y_ratio=0.5f){igSetScrollFromPosYFloat(local_y,center_y_ratio);}
void igSetScrollFromPosY(ImGuiWindow* window,float local_y,float center_y_ratio){igSetScrollFromPosYWindowPtr(window,local_y,center_y_ratio);}
void igSetScrollX(float scroll_x){igSetScrollXFloat(scroll_x);}
void igSetScrollX(ImGuiWindow* window,float scroll_x){igSetScrollXWindowPtr(window,scroll_x);}
void igSetScrollY(float scroll_y){igSetScrollYFloat(scroll_y);}
void igSetScrollY(ImGuiWindow* window,float scroll_y){igSetScrollYWindowPtr(window,scroll_y);}
void igSetWindowCollapsed(bool collapsed,ImGuiCond cond=0){igSetWindowCollapsedBool(collapsed,cond);}
void igSetWindowCollapsed(const (char)* name,bool collapsed,ImGuiCond cond=0){igSetWindowCollapsedStr(name,collapsed,cond);}
void igSetWindowCollapsed(ImGuiWindow* window,bool collapsed,ImGuiCond cond=0){igSetWindowCollapsedWindowPtr(window,collapsed,cond);}
void igSetWindowFocus(){igSetWindowFocusNil();}
void igSetWindowFocus(const (char)* name){igSetWindowFocusStr(name);}
void igSetWindowPos(const ref ImVec2 pos,ImGuiCond cond=0){igSetWindowPosVec2(pos,cond);}
void igSetWindowPos(const (char)* name,const ref ImVec2 pos,ImGuiCond cond=0){igSetWindowPosStr(name,pos,cond);}
void igSetWindowPos(ImGuiWindow* window,const ref ImVec2 pos,ImGuiCond cond=0){igSetWindowPosWindowPtr(window,pos,cond);}
void igSetWindowSize(const ref ImVec2 size,ImGuiCond cond=0){igSetWindowSizeVec2(size,cond);}
void igSetWindowSize(const (char)* name,const ref ImVec2 size,ImGuiCond cond=0){igSetWindowSizeStr(name,size,cond);}
void igSetWindowSize(ImGuiWindow* window,const ref ImVec2 size,ImGuiCond cond=0){igSetWindowSizeWindowPtr(window,size,cond);}
/**
*	bool igTreeNode(const (char)* label)
*	bool igTreeNode(const (char)* str_id,const (char)* fmt,...)
*	bool igTreeNode(const void* ptr_id,const (char)* fmt,...)
*/
alias igTreeNode= overload!(igTreeNodeStr,igTreeNodeStrStr,igTreeNodePtr);
/**
*	bool igTreeNodeEx(const (char)* label,ImGuiTreeNodeFlags flags=0)
*	bool igTreeNodeEx(const (char)* str_id,ImGuiTreeNodeFlags flags,const (char)* fmt,...)
*	bool igTreeNodeEx(const void* ptr_id,ImGuiTreeNodeFlags flags,const (char)* fmt,...)
*/
alias igTreeNodeEx= overload!(igTreeNodeExStr,igTreeNodeExStrStr,igTreeNodeExPtr);
bool igTreeNodeExV(const (char)* str_id,ImGuiTreeNodeFlags flags,const (char)* fmt,va_list args){igTreeNodeExVStr(str_id,flags,fmt,args);}
bool igTreeNodeExV(const void* ptr_id,ImGuiTreeNodeFlags flags,const (char)* fmt,va_list args){igTreeNodeExVPtr(ptr_id,flags,fmt,args);}
bool igTreeNodeV(const (char)* str_id,const (char)* fmt,va_list args){igTreeNodeVStr(str_id,fmt,args);}
bool igTreeNodeV(const void* ptr_id,const (char)* fmt,va_list args){igTreeNodeVPtr(ptr_id,fmt,args);}
void igTreePush(const (char)* str_id){igTreePushStr(str_id);}
void igTreePush(const void* ptr_id= null){igTreePushPtr(ptr_id);}
void igValue(const (char)* prefix,bool b){igValueBool(prefix,b);}
void igValue(const (char)* prefix,int v){igValueInt(prefix,v);}
void igValue(const (char)* prefix,uint v){igValueUint(prefix,v);}
void igValue(const (char)* prefix,float v,const (char)* float_format= null){igValueFloat(prefix,v,float_format);}
