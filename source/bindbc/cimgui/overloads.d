module bindbc.cimgui.overloads;

import bindbc.cimgui.funcs;
import bindbc.cimgui.types;
extern(C): 

import core.stdc.stdarg;
static template overload(Funcs...)
{
    import std.traits : Parameters;
    static foreach(f; Funcs)
        auto overload(Parameters!f params){
            return f(params);}
}
ImColor* newImColor(){return ImColor_ImColorNil();}
ImColor* newImColor(int r,int g,int b,int a){return ImColor_ImColorInt(r,g,b,a);}
ImColor* newImColor(ImU32 rgba){return ImColor_ImColorU32(rgba);}
ImColor* newImColor(float r,float g,float b,float a){return ImColor_ImColorFloat(r,g,b,a);}
ImColor* newImColor(const ImVec4 col){return ImColor_ImColorVec4(col);}
void AddText(ImDrawList* self,const ImVec2 pos,ImU32 col,const (char)* text_begin,const (char)* text_end){ImDrawList_AddTextVec2(self,pos,col,text_begin,text_end);}
void AddText(ImDrawList* self,const ImFont* font,float font_size,const ImVec2 pos,ImU32 col,const (char)* text_begin,const (char)* text_end,float wrap_width,const ImVec4* cpu_fine_clip_rect){ImDrawList_AddTextFontPtr(self,font,font_size,pos,col,text_begin,text_end,wrap_width,cpu_fine_clip_rect);}
ImGuiPtrOrIndex* newImGuiPtrOrIndex(void* ptr){return ImGuiPtrOrIndex_ImGuiPtrOrIndexPtr(ptr);}
ImGuiPtrOrIndex* newImGuiPtrOrIndex(int index){return ImGuiPtrOrIndex_ImGuiPtrOrIndexInt(index);}
ImGuiStoragePair* newImGuiStoragePair(ImGuiID _key,int _val_i){return ImGuiStoragePair_ImGuiStoragePairInt(_key,_val_i);}
ImGuiStoragePair* newImGuiStoragePair(ImGuiID _key,float _val_f){return ImGuiStoragePair_ImGuiStoragePairFloat(_key,_val_f);}
ImGuiStoragePair* newImGuiStoragePair(ImGuiID _key,void* _val_p){return ImGuiStoragePair_ImGuiStoragePairPtr(_key,_val_p);}
ImGuiStyleMod* newImGuiStyleMod(ImGuiStyleVar idx,int v){return ImGuiStyleMod_ImGuiStyleModInt(idx,v);}
ImGuiStyleMod* newImGuiStyleMod(ImGuiStyleVar idx,float v){return ImGuiStyleMod_ImGuiStyleModFloat(idx,v);}
ImGuiStyleMod* newImGuiStyleMod(ImGuiStyleVar idx,ImVec2 v){return ImGuiStyleMod_ImGuiStyleModVec2(idx,v);}
ImGuiTextRange* newImGuiTextRange(){return ImGuiTextRange_ImGuiTextRangeNil();}
ImGuiTextRange* newImGuiTextRange(const (char)* _b,const (char)* _e){return ImGuiTextRange_ImGuiTextRangeStr(_b,_e);}
ImGuiID GetID(ImGuiWindow* self,const (char)* str,const (char)* str_end){return ImGuiWindow_GetIDStr(self,str,str_end);}
ImGuiID GetID(ImGuiWindow* self,const void* ptr){return ImGuiWindow_GetIDPtr(self,ptr);}
ImGuiID GetID(ImGuiWindow* self,int n){return ImGuiWindow_GetIDInt(self,n);}
ImGuiID GetIDNoKeepAlive(ImGuiWindow* self,const (char)* str,const (char)* str_end){return ImGuiWindow_GetIDNoKeepAliveStr(self,str,str_end);}
ImGuiID GetIDNoKeepAlive(ImGuiWindow* self,const void* ptr){return ImGuiWindow_GetIDNoKeepAlivePtr(self,ptr);}
ImGuiID GetIDNoKeepAlive(ImGuiWindow* self,int n){return ImGuiWindow_GetIDNoKeepAliveInt(self,n);}
void Add(ImRect* self,const ImVec2 p){ImRect_AddVec2(self,p);}
void Add(ImRect* self,const ImRect r){ImRect_AddRect(self,r);}
bool Contains(ImRect* self,const ImVec2 p){return ImRect_ContainsVec2(self,p);}
bool Contains(ImRect* self,const ImRect r){return ImRect_ContainsRect(self,r);}
void Expand(ImRect* self,const float amount){ImRect_ExpandFloat(self,amount);}
void Expand(ImRect* self,const ImVec2 amount){ImRect_ExpandVec2(self,amount);}
ImRect* newImRect(){return ImRect_ImRectNil();}
ImRect* newImRect(const ImVec2 min,const ImVec2 max){return ImRect_ImRectVec2(min,max);}
ImRect* newImRect(const ImVec4 v){return ImRect_ImRectVec4(v);}
ImRect* newImRect(float x1,float y1,float x2,float y2){return ImRect_ImRectFloat(x1,y1,x2,y2);}
ImVec1* newImVec1(){return ImVec1_ImVec1Nil();}
ImVec1* newImVec1(float _x){return ImVec1_ImVec1Float(_x);}
ImVec2* newImVec2(){return ImVec2_ImVec2Nil();}
ImVec2* newImVec2(float _x,float _y){return ImVec2_ImVec2Float(_x,_y);}
ImVec2ih* newImVec2ih(){return ImVec2ih_ImVec2ihNil();}
ImVec2ih* newImVec2ih(short _x,short _y){return ImVec2ih_ImVec2ihshort(_x,_y);}
ImVec2ih* newImVec2ih(const ImVec2 rhs){return ImVec2ih_ImVec2ihVec2(rhs);}
ImVec4* newImVec4(){return ImVec4_ImVec4Nil();}
ImVec4* newImVec4(float _x,float _y,float _z,float _w){return ImVec4_ImVec4Float(_x,_y,_z,_w);}
bool igBeginChild(const (char)* str_id,const ImVec2 size,bool border,ImGuiWindowFlags flags){return igBeginChildStr(str_id,size,border,flags);}
bool igBeginChild(ImGuiID id,const ImVec2 size,bool border,ImGuiWindowFlags flags){return igBeginChildID(id,size,border,flags);}
bool igCollapsingHeader(const (char)* label,ImGuiTreeNodeFlags flags){return igCollapsingHeaderTreeNodeFlags(label,flags);}
bool igCollapsingHeader(const (char)* label,bool* p_open,ImGuiTreeNodeFlags flags){return igCollapsingHeaderBoolPtr(label,p_open,flags);}
bool igCombo(const (char)* label,int* current_item,const (char)* * items,int items_count,int popup_max_height_in_items){return igComboStr_arr(label,current_item,items,items_count,popup_max_height_in_items);}
bool igCombo(const (char)* label,int* current_item,const (char)* items_separated_by_zeros,int popup_max_height_in_items){return igComboStr(label,current_item,items_separated_by_zeros,popup_max_height_in_items);}
bool igCombo(const (char)* label,int* current_item,bool function(void* data,int idx,const (char)** out_text) items_getter,void* data,int items_count,int popup_max_height_in_items){return igComboFnBoolPtr(label,current_item,items_getter,data,items_count,popup_max_height_in_items);}
ImDrawList* igGetBackgroundDrawList(){return igGetBackgroundDrawListNil();}
ImDrawList* igGetBackgroundDrawList(ImGuiViewport* viewport){return igGetBackgroundDrawListViewportPtr(viewport);}
ImU32 igGetColorU32(ImGuiCol idx,float alpha_mul){return igGetColorU32Col(idx,alpha_mul);}
ImU32 igGetColorU32(const ImVec4 col){return igGetColorU32Vec4(col);}
ImU32 igGetColorU32(ImU32 col){return igGetColorU32U32(col);}
ImDrawList* igGetForegroundDrawList(){return igGetForegroundDrawListNil();}
ImDrawList* igGetForegroundDrawList(ImGuiViewport* viewport){return igGetForegroundDrawListViewportPtr(viewport);}
ImDrawList* igGetForegroundDrawList(ImGuiWindow* window){return igGetForegroundDrawListWindowPtr(window);}
ImGuiID igGetID(const (char)* str_id){return igGetIDStr(str_id);}
ImGuiID igGetID(const (char)* str_id_begin,const (char)* str_id_end){return igGetIDStrStr(str_id_begin,str_id_end);}
ImGuiID igGetID(const void* ptr_id){return igGetIDPtr(ptr_id);}
float igImAbs(float x){return igImAbsFloat(x);}
double igImAbs(double x){return igImAbsdouble(x);}
float igImFloor(float f){return igImFloorFloat(f);}
ImVec2 igImFloor(const ImVec2 v){ImVec2 pOut;	igImFloorVec2(&pOut,v);	 return pOut;}
float igImLengthSqr(const ImVec2 lhs){return igImLengthSqrVec2(lhs);}
float igImLengthSqr(const ImVec4 lhs){return igImLengthSqrVec4(lhs);}
ImVec2 igImLerp(const ImVec2 a,const ImVec2 b,float t){ImVec2 pOut;	igImLerpVec2Float(&pOut,a,b,t);	 return pOut;}
ImVec2 igImLerp(const ImVec2 a,const ImVec2 b,const ImVec2 t){ImVec2 pOut;	igImLerpVec2Vec2(&pOut,a,b,t);	 return pOut;}
ImVec4 igImLerp(const ImVec4 a,const ImVec4 b,float t){ImVec4 pOut;	igImLerpVec4(&pOut,a,b,t);	 return pOut;}
float igImLog(float x){return igImLogFloat(x);}
double igImLog(double x){return igImLogdouble(x);}
float igImPow(float x,float y){return igImPowFloat(x,y);}
double igImPow(double x,double y){return igImPowdouble(x,y);}
float igImSign(float x){return igImSignFloat(x);}
double igImSign(double x){return igImSigndouble(x);}
bool igIsPopupOpen(const (char)* str_id,ImGuiPopupFlags flags){return igIsPopupOpenStr(str_id,flags);}
bool igIsPopupOpen(ImGuiID id,ImGuiPopupFlags popup_flags){return igIsPopupOpenID(id,popup_flags);}
bool igIsRectVisible(const ImVec2 size){return igIsRectVisibleNil(size);}
bool igIsRectVisible(const ImVec2 rect_min,const ImVec2 rect_max){return igIsRectVisibleVec2(rect_min,rect_max);}
void igItemSize(const ImVec2 size,float text_baseline_y){igItemSizeVec2(size,text_baseline_y);}
void igItemSize(const ImRect bb,float text_baseline_y){igItemSizeRect(bb,text_baseline_y);}
bool igListBox(const (char)* label,int* current_item,const (char)* * items,int items_count,int height_in_items){return igListBoxStr_arr(label,current_item,items,items_count,height_in_items);}
bool igListBox(const (char)* label,int* current_item,bool function(void* data,int idx,const (char)** out_text) items_getter,void* data,int items_count,int height_in_items){return igListBoxFnBoolPtr(label,current_item,items_getter,data,items_count,height_in_items);}
bool igListBoxHeader(const (char)* label,const ImVec2 size){return igListBoxHeaderVec2(label,size);}
bool igListBoxHeader(const (char)* label,int items_count,int height_in_items){return igListBoxHeaderInt(label,items_count,height_in_items);}
void igMarkIniSettingsDirty(){igMarkIniSettingsDirtyNil();}
void igMarkIniSettingsDirty(ImGuiWindow* window){igMarkIniSettingsDirtyWindowPtr(window);}
bool igMenuItem(const (char)* label,const (char)* shortcut,bool selected,bool enabled){return igMenuItemBool(label,shortcut,selected,enabled);}
bool igMenuItem(const (char)* label,const (char)* shortcut,bool* p_selected,bool enabled){return igMenuItemBoolPtr(label,shortcut,p_selected,enabled);}
void igPlotHistogram(const (char)* label,const float* values,int values_count,int values_offset,const (char)* overlay_text,float scale_min,float scale_max,ImVec2 graph_size,int stride){igPlotHistogramFloatPtr(label,values,values_count,values_offset,overlay_text,scale_min,scale_max,graph_size,stride);}
void igPlotHistogram(const (char)* label,float function(void* data,int idx) values_getter,void* data,int values_count,int values_offset,const (char)* overlay_text,float scale_min,float scale_max,ImVec2 graph_size){igPlotHistogramFnFloatPtr(label,values_getter,data,values_count,values_offset,overlay_text,scale_min,scale_max,graph_size);}
void igPlotLines(const (char)* label,const float* values,int values_count,int values_offset,const (char)* overlay_text,float scale_min,float scale_max,ImVec2 graph_size,int stride){igPlotLinesFloatPtr(label,values,values_count,values_offset,overlay_text,scale_min,scale_max,graph_size,stride);}
void igPlotLines(const (char)* label,float function(void* data,int idx) values_getter,void* data,int values_count,int values_offset,const (char)* overlay_text,float scale_min,float scale_max,ImVec2 graph_size){igPlotLinesFnFloatPtr(label,values_getter,data,values_count,values_offset,overlay_text,scale_min,scale_max,graph_size);}
void igPushID(const (char)* str_id){igPushIDStr(str_id);}
void igPushID(const (char)* str_id_begin,const (char)* str_id_end){igPushIDStrStr(str_id_begin,str_id_end);}
void igPushID(const void* ptr_id){igPushIDPtr(ptr_id);}
void igPushID(int int_id){igPushIDInt(int_id);}
void igPushStyleColor(ImGuiCol idx,ImU32 col){igPushStyleColorU32(idx,col);}
void igPushStyleColor(ImGuiCol idx,const ImVec4 col){igPushStyleColorVec4(idx,col);}
void igPushStyleVar(ImGuiStyleVar idx,float val){igPushStyleVarFloat(idx,val);}
void igPushStyleVar(ImGuiStyleVar idx,const ImVec2 val){igPushStyleVarVec2(idx,val);}
bool igRadioButton(const (char)* label,bool active){return igRadioButtonBool(label,active);}
bool igRadioButton(const (char)* label,int* v,int v_button){return igRadioButtonIntPtr(label,v,v_button);}
bool igSelectable(const (char)* label,bool selected,ImGuiSelectableFlags flags,const ImVec2 size){return igSelectableBool(label,selected,flags,size);}
bool igSelectable(const (char)* label,bool* p_selected,ImGuiSelectableFlags flags,const ImVec2 size){return igSelectableBoolPtr(label,p_selected,flags,size);}
void igSetScrollFromPosX(float local_x,float center_x_ratio){igSetScrollFromPosXFloat(local_x,center_x_ratio);}
void igSetScrollFromPosX(ImGuiWindow* window,float local_x,float center_x_ratio){igSetScrollFromPosXWindowPtr(window,local_x,center_x_ratio);}
void igSetScrollFromPosY(float local_y,float center_y_ratio){igSetScrollFromPosYFloat(local_y,center_y_ratio);}
void igSetScrollFromPosY(ImGuiWindow* window,float local_y,float center_y_ratio){igSetScrollFromPosYWindowPtr(window,local_y,center_y_ratio);}
void igSetScrollX(float scroll_x){igSetScrollXFloat(scroll_x);}
void igSetScrollX(ImGuiWindow* window,float scroll_x){igSetScrollXWindowPtr(window,scroll_x);}
void igSetScrollY(float scroll_y){igSetScrollYFloat(scroll_y);}
void igSetScrollY(ImGuiWindow* window,float scroll_y){igSetScrollYWindowPtr(window,scroll_y);}
void igSetWindowCollapsed(bool collapsed,ImGuiCond cond){igSetWindowCollapsedBool(collapsed,cond);}
void igSetWindowCollapsed(const (char)* name,bool collapsed,ImGuiCond cond){igSetWindowCollapsedStr(name,collapsed,cond);}
void igSetWindowCollapsed(ImGuiWindow* window,bool collapsed,ImGuiCond cond){igSetWindowCollapsedWindowPtr(window,collapsed,cond);}
void igSetWindowFocus(){igSetWindowFocusNil();}
void igSetWindowFocus(const (char)* name){igSetWindowFocusStr(name);}
void igSetWindowPos(const ImVec2 pos,ImGuiCond cond){igSetWindowPosVec2(pos,cond);}
void igSetWindowPos(const (char)* name,const ImVec2 pos,ImGuiCond cond){igSetWindowPosStr(name,pos,cond);}
void igSetWindowPos(ImGuiWindow* window,const ImVec2 pos,ImGuiCond cond){igSetWindowPosWindowPtr(window,pos,cond);}
void igSetWindowSize(const ImVec2 size,ImGuiCond cond){igSetWindowSizeVec2(size,cond);}
void igSetWindowSize(const (char)* name,const ImVec2 size,ImGuiCond cond){igSetWindowSizeStr(name,size,cond);}
void igSetWindowSize(ImGuiWindow* window,const ImVec2 size,ImGuiCond cond){igSetWindowSizeWindowPtr(window,size,cond);}
/**
*	bool igTreeNode(const (char)* label)
*	bool igTreeNode(const (char)* str_id,const (char)* fmt,...)
*	bool igTreeNode(const void* ptr_id,const (char)* fmt,...)
*/
alias igTreeNode= overload!(igTreeNodeStr,igTreeNodeStrStr,igTreeNodePtr);
/**
*	bool igTreeNodeEx(const (char)* label,ImGuiTreeNodeFlags flags)
*	bool igTreeNodeEx(const (char)* str_id,ImGuiTreeNodeFlags flags,const (char)* fmt,...)
*	bool igTreeNodeEx(const void* ptr_id,ImGuiTreeNodeFlags flags,const (char)* fmt,...)
*/
alias igTreeNodeEx= overload!(igTreeNodeExStr,igTreeNodeExStrStr,igTreeNodeExPtr);
bool igTreeNodeExV(const (char)* str_id,ImGuiTreeNodeFlags flags,const (char)* fmt,va_list args){return igTreeNodeExVStr(str_id,flags,fmt,args);}
bool igTreeNodeExV(const void* ptr_id,ImGuiTreeNodeFlags flags,const (char)* fmt,va_list args){return igTreeNodeExVPtr(ptr_id,flags,fmt,args);}
bool igTreeNodeV(const (char)* str_id,const (char)* fmt,va_list args){return igTreeNodeVStr(str_id,fmt,args);}
bool igTreeNodeV(const void* ptr_id,const (char)* fmt,va_list args){return igTreeNodeVPtr(ptr_id,fmt,args);}
void igTreePush(const (char)* str_id){igTreePushStr(str_id);}
void igTreePush(const void* ptr_id){igTreePushPtr(ptr_id);}
void igValue(const (char)* prefix,bool b){igValueBool(prefix,b);}
void igValue(const (char)* prefix,int v){igValueInt(prefix,v);}
void igValue(const (char)* prefix,uint v){igValueUint(prefix,v);}
void igValue(const (char)* prefix,float v,const (char)* float_format){igValueFloat(prefix,v,float_format);}
