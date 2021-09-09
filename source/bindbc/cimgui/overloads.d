module bindbc.cimgui.overloads;

import bindbc.cimgui.funcs;
import bindbc.cimgui.types;

import core.stdc.stdarg;
static template overload(Funcs...)
{
    import std.traits : Parameters;
    static foreach(f; Funcs)
        auto overload(Parameters!f params){
            return f(params);}
}
ImColor* newImColor(){return ImColor_ImColor_Nil();}
ImColor* newImColor(int r,int g,int b,int a){return ImColor_ImColor_Int(r,g,b,a);}
ImColor* newImColor(ImU32 rgba){return ImColor_ImColor_U32(rgba);}
ImColor* newImColor(float r,float g,float b,float a){return ImColor_ImColor_Float(r,g,b,a);}
ImColor* newImColor(const ImVec4 col){return ImColor_ImColor_Vec4(col);}
void ImDrawList_AddText(ImDrawList* self,const ImVec2 pos,ImU32 col,const (char)* text_begin,const (char)* text_end){ImDrawList_AddText_Vec2(self,pos,col,text_begin,text_end);}
void ImDrawList_AddText(ImDrawList* self,const ImFont* font,float font_size,const ImVec2 pos,ImU32 col,const (char)* text_begin,const (char)* text_end,float wrap_width,const ImVec4* cpu_fine_clip_rect){ImDrawList_AddText_FontPtr(self,font,font_size,pos,col,text_begin,text_end,wrap_width,cpu_fine_clip_rect);}
ImGuiPtrOrIndex* newImGuiPtrOrIndex(void* ptr){return ImGuiPtrOrIndex_ImGuiPtrOrIndex_Ptr(ptr);}
ImGuiPtrOrIndex* newImGuiPtrOrIndex(int index){return ImGuiPtrOrIndex_ImGuiPtrOrIndex_Int(index);}
ImGuiStoragePair* newImGuiStoragePair(ImGuiID _key,int _val_i){return ImGuiStoragePair_ImGuiStoragePair_Int(_key,_val_i);}
ImGuiStoragePair* newImGuiStoragePair(ImGuiID _key,float _val_f){return ImGuiStoragePair_ImGuiStoragePair_Float(_key,_val_f);}
ImGuiStoragePair* newImGuiStoragePair(ImGuiID _key,void* _val_p){return ImGuiStoragePair_ImGuiStoragePair_Ptr(_key,_val_p);}
ImGuiStyleMod* newImGuiStyleMod(ImGuiStyleVar idx,int v){return ImGuiStyleMod_ImGuiStyleMod_Int(idx,v);}
ImGuiStyleMod* newImGuiStyleMod(ImGuiStyleVar idx,float v){return ImGuiStyleMod_ImGuiStyleMod_Float(idx,v);}
ImGuiStyleMod* newImGuiStyleMod(ImGuiStyleVar idx,ImVec2 v){return ImGuiStyleMod_ImGuiStyleMod_Vec2(idx,v);}
ImGuiTextRange* newImGuiTextRange(){return ImGuiTextRange_ImGuiTextRange_Nil();}
ImGuiTextRange* newImGuiTextRange(const (char)* _b,const (char)* _e){return ImGuiTextRange_ImGuiTextRange_Str(_b,_e);}
ImGuiID ImGuiWindow_GetID(ImGuiWindow* self,const (char)* str,const (char)* str_end){return ImGuiWindow_GetID_Str(self,str,str_end);}
ImGuiID ImGuiWindow_GetID(ImGuiWindow* self,const void* ptr){return ImGuiWindow_GetID_Ptr(self,ptr);}
ImGuiID ImGuiWindow_GetID(ImGuiWindow* self,int n){return ImGuiWindow_GetID_Int(self,n);}
ImGuiID ImGuiWindow_GetIDNoKeepAlive(ImGuiWindow* self,const (char)* str,const (char)* str_end){return ImGuiWindow_GetIDNoKeepAlive_Str(self,str,str_end);}
ImGuiID ImGuiWindow_GetIDNoKeepAlive(ImGuiWindow* self,const void* ptr){return ImGuiWindow_GetIDNoKeepAlive_Ptr(self,ptr);}
ImGuiID ImGuiWindow_GetIDNoKeepAlive(ImGuiWindow* self,int n){return ImGuiWindow_GetIDNoKeepAlive_Int(self,n);}
void ImRect_Add(ImRect* self,const ImVec2 p){ImRect_Add_Vec2(self,p);}
void ImRect_Add(ImRect* self,const ImRect r){ImRect_Add_Rect(self,r);}
bool ImRect_Contains(ImRect* self,const ImVec2 p){return ImRect_Contains_Vec2(self,p);}
bool ImRect_Contains(ImRect* self,const ImRect r){return ImRect_Contains_Rect(self,r);}
void ImRect_Expand(ImRect* self,const float amount){ImRect_Expand_Float(self,amount);}
void ImRect_Expand(ImRect* self,const ImVec2 amount){ImRect_Expand_Vec2(self,amount);}
ImRect* newImRect(){return ImRect_ImRect_Nil();}
ImRect* newImRect(const ImVec2 min,const ImVec2 max){return ImRect_ImRect_Vec2(min,max);}
ImRect* newImRect(const ImVec4 v){return ImRect_ImRect_Vec4(v);}
ImRect* newImRect(float x1,float y1,float x2,float y2){return ImRect_ImRect_Float(x1,y1,x2,y2);}
ImVec1* newImVec1(){return ImVec1_ImVec1_Nil();}
ImVec1* newImVec1(float _x){return ImVec1_ImVec1_Float(_x);}
ImVec2* newImVec2(){return ImVec2_ImVec2_Nil();}
ImVec2* newImVec2(float _x,float _y){return ImVec2_ImVec2_Float(_x,_y);}
ImVec2ih* newImVec2ih(){return ImVec2ih_ImVec2ih_Nil();}
ImVec2ih* newImVec2ih(short _x,short _y){return ImVec2ih_ImVec2ih_short(_x,_y);}
ImVec2ih* newImVec2ih(const ImVec2 rhs){return ImVec2ih_ImVec2ih_Vec2(rhs);}
ImVec4* newImVec4(){return ImVec4_ImVec4_Nil();}
ImVec4* newImVec4(float _x,float _y,float _z,float _w){return ImVec4_ImVec4_Float(_x,_y,_z,_w);}
bool igBeginChild(const (char)* str_id,const ImVec2 size,bool border,ImGuiWindowFlags flags){return igBeginChild_Str(str_id,size,border,flags);}
bool igBeginChild(ImGuiID id,const ImVec2 size,bool border,ImGuiWindowFlags flags){return igBeginChild_ID(id,size,border,flags);}
bool igCheckboxFlags(const (char)* label,int* flags,int flags_value){return igCheckboxFlags_IntPtr(label,flags,flags_value);}
bool igCheckboxFlags(const (char)* label,uint* flags,uint flags_value){return igCheckboxFlags_UintPtr(label,flags,flags_value);}
bool igCheckboxFlags(const (char)* label,ImS64* flags,ImS64 flags_value){return igCheckboxFlags_S64Ptr(label,flags,flags_value);}
bool igCheckboxFlags(const (char)* label,ImU64* flags,ImU64 flags_value){return igCheckboxFlags_U64Ptr(label,flags,flags_value);}
bool igCollapsingHeader(const (char)* label,ImGuiTreeNodeFlags flags){return igCollapsingHeader_TreeNodeFlags(label,flags);}
bool igCollapsingHeader(const (char)* label,bool* p_visible,ImGuiTreeNodeFlags flags){return igCollapsingHeader_BoolPtr(label,p_visible,flags);}
bool igCombo(const (char)* label,int* current_item,const (char)* * items,int items_count,int popup_max_height_in_items){return igCombo_Str_arr(label,current_item,items,items_count,popup_max_height_in_items);}
bool igCombo(const (char)* label,int* current_item,const (char)* items_separated_by_zeros,int popup_max_height_in_items){return igCombo_Str(label,current_item,items_separated_by_zeros,popup_max_height_in_items);}

alias igCombo_items_getter = extern(C) bool function (void* data,int idx,const (char)** out_text);
bool igCombo(const (char)* label,int* current_item,igCombo_items_getter items_getter, void* data,int items_count,int popup_max_height_in_items){return igCombo_FnBoolPtr(label,current_item,items_getter,data,items_count,popup_max_height_in_items);}
ImDrawList* igGetBackgroundDrawList(){return igGetBackgroundDrawList_Nil();}
ImDrawList* igGetBackgroundDrawList(ImGuiViewport* viewport){return igGetBackgroundDrawList_ViewportPtr(viewport);}
ImU32 igGetColorU32(ImGuiCol idx,float alpha_mul){return igGetColorU32_Col(idx,alpha_mul);}
ImU32 igGetColorU32(const ImVec4 col){return igGetColorU32_Vec4(col);}
ImU32 igGetColorU32(ImU32 col){return igGetColorU32_U32(col);}
ImDrawList* igGetForegroundDrawList(){return igGetForegroundDrawList_Nil();}
ImDrawList* igGetForegroundDrawList(ImGuiViewport* viewport){return igGetForegroundDrawList_ViewportPtr(viewport);}
ImDrawList* igGetForegroundDrawList(ImGuiWindow* window){return igGetForegroundDrawList_WindowPtr(window);}
ImGuiID igGetID(const (char)* str_id){return igGetID_Str(str_id);}
ImGuiID igGetID(const (char)* str_id_begin,const (char)* str_id_end){return igGetID_StrStr(str_id_begin,str_id_end);}
ImGuiID igGetID(const void* ptr_id){return igGetID_Ptr(ptr_id);}
int igImAbs(int x){return igImAbs_Int(x);}
float igImAbs(float x){return igImAbs_Float(x);}
double igImAbs(double x){return igImAbs_double(x);}
float igImFloor(float f){return igImFloor_Float(f);}
ImVec2 igImFloor(const ImVec2 v){ImVec2 pOut;	igImFloor_Vec2(&pOut,v);	 return pOut;}
bool igImIsPowerOfTwo(int v){return igImIsPowerOfTwo_Int(v);}
bool igImIsPowerOfTwo(ImU64 v){return igImIsPowerOfTwo_U64(v);}
float igImLengthSqr(const ImVec2 lhs){return igImLengthSqr_Vec2(lhs);}
float igImLengthSqr(const ImVec4 lhs){return igImLengthSqr_Vec4(lhs);}
ImVec2 igImLerp(const ImVec2 a,const ImVec2 b,float t){ImVec2 pOut;	igImLerp_Vec2Float(&pOut,a,b,t);	 return pOut;}
ImVec2 igImLerp(const ImVec2 a,const ImVec2 b,const ImVec2 t){ImVec2 pOut;	igImLerp_Vec2Vec2(&pOut,a,b,t);	 return pOut;}
ImVec4 igImLerp(const ImVec4 a,const ImVec4 b,float t){ImVec4 pOut;	igImLerp_Vec4(&pOut,a,b,t);	 return pOut;}
float igImLog(float x){return igImLog_Float(x);}
double igImLog(double x){return igImLog_double(x);}
float igImPow(float x,float y){return igImPow_Float(x,y);}
double igImPow(double x,double y){return igImPow_double(x,y);}
float igImRsqrt(float x){return igImRsqrt_Float(x);}
double igImRsqrt(double x){return igImRsqrt_double(x);}
float igImSign(float x){return igImSign_Float(x);}
double igImSign(double x){return igImSign_double(x);}
bool igIsPopupOpen(const (char)* str_id,ImGuiPopupFlags flags){return igIsPopupOpen_Str(str_id,flags);}
bool igIsPopupOpen(ImGuiID id,ImGuiPopupFlags popup_flags){return igIsPopupOpen_ID(id,popup_flags);}
bool igIsRectVisible(const ImVec2 size){return igIsRectVisible_Nil(size);}
bool igIsRectVisible(const ImVec2 rect_min,const ImVec2 rect_max){return igIsRectVisible_Vec2(rect_min,rect_max);}
void igItemSize(const ImVec2 size,float text_baseline_y){igItemSize_Vec2(size,text_baseline_y);}
void igItemSize(const ImRect bb,float text_baseline_y){igItemSize_Rect(bb,text_baseline_y);}
bool igListBox(const (char)* label,int* current_item,const (char)* * items,int items_count,int height_in_items){return igListBox_Str_arr(label,current_item,items,items_count,height_in_items);}

alias igListBox_items_getter = extern(C) bool function (void* data,int idx,const (char)** out_text);
bool igListBox(const (char)* label,int* current_item,igListBox_items_getter items_getter, void* data,int items_count,int height_in_items){return igListBox_FnBoolPtr(label,current_item,items_getter,data,items_count,height_in_items);}
void igMarkIniSettingsDirty(){igMarkIniSettingsDirty_Nil();}
void igMarkIniSettingsDirty(ImGuiWindow* window){igMarkIniSettingsDirty_WindowPtr(window);}
bool igMenuItem(const (char)* label,const (char)* shortcut,bool selected,bool enabled){return igMenuItem_Bool(label,shortcut,selected,enabled);}
bool igMenuItem(const (char)* label,const (char)* shortcut,bool* p_selected,bool enabled){return igMenuItem_BoolPtr(label,shortcut,p_selected,enabled);}
void igOpenPopup(const (char)* str_id,ImGuiPopupFlags popup_flags){igOpenPopup_Str(str_id,popup_flags);}
void igOpenPopup(ImGuiID id,ImGuiPopupFlags popup_flags){igOpenPopup_ID(id,popup_flags);}
void igPlotHistogram(const (char)* label,const float* values,int values_count,int values_offset,const (char)* overlay_text,float scale_min,float scale_max,ImVec2 graph_size,int stride){igPlotHistogram_FloatPtr(label,values,values_count,values_offset,overlay_text,scale_min,scale_max,graph_size,stride);}

alias igPlotHistogram_values_getter = extern(C) float function (void* data,int idx);
void igPlotHistogram(const (char)* label,igPlotHistogram_values_getter values_getter, void* data,int values_count,int values_offset,const (char)* overlay_text,float scale_min,float scale_max,ImVec2 graph_size){igPlotHistogram_FnFloatPtr(label,values_getter,data,values_count,values_offset,overlay_text,scale_min,scale_max,graph_size);}
void igPlotLines(const (char)* label,const float* values,int values_count,int values_offset,const (char)* overlay_text,float scale_min,float scale_max,ImVec2 graph_size,int stride){igPlotLines_FloatPtr(label,values,values_count,values_offset,overlay_text,scale_min,scale_max,graph_size,stride);}

alias igPlotLines_values_getter = extern(C) float function (void* data,int idx);
void igPlotLines(const (char)* label,igPlotLines_values_getter values_getter, void* data,int values_count,int values_offset,const (char)* overlay_text,float scale_min,float scale_max,ImVec2 graph_size){igPlotLines_FnFloatPtr(label,values_getter,data,values_count,values_offset,overlay_text,scale_min,scale_max,graph_size);}
void igPushID(const (char)* str_id){igPushID_Str(str_id);}
void igPushID(const (char)* str_id_begin,const (char)* str_id_end){igPushID_StrStr(str_id_begin,str_id_end);}
void igPushID(const void* ptr_id){igPushID_Ptr(ptr_id);}
void igPushID(int int_id){igPushID_Int(int_id);}
void igPushStyleColor(ImGuiCol idx,ImU32 col){igPushStyleColor_U32(idx,col);}
void igPushStyleColor(ImGuiCol idx,const ImVec4 col){igPushStyleColor_Vec4(idx,col);}
void igPushStyleVar(ImGuiStyleVar idx,float val){igPushStyleVar_Float(idx,val);}
void igPushStyleVar(ImGuiStyleVar idx,const ImVec2 val){igPushStyleVar_Vec2(idx,val);}
bool igRadioButton(const (char)* label,bool active){return igRadioButton_Bool(label,active);}
bool igRadioButton(const (char)* label,int* v,int v_button){return igRadioButton_IntPtr(label,v,v_button);}
bool igSelectable(const (char)* label,bool selected,ImGuiSelectableFlags flags,const ImVec2 size){return igSelectable_Bool(label,selected,flags,size);}
bool igSelectable(const (char)* label,bool* p_selected,ImGuiSelectableFlags flags,const ImVec2 size){return igSelectable_BoolPtr(label,p_selected,flags,size);}
void igSetScrollFromPosX(float local_x,float center_x_ratio){igSetScrollFromPosX_Float(local_x,center_x_ratio);}
void igSetScrollFromPosX(ImGuiWindow* window,float local_x,float center_x_ratio){igSetScrollFromPosX_WindowPtr(window,local_x,center_x_ratio);}
void igSetScrollFromPosY(float local_y,float center_y_ratio){igSetScrollFromPosY_Float(local_y,center_y_ratio);}
void igSetScrollFromPosY(ImGuiWindow* window,float local_y,float center_y_ratio){igSetScrollFromPosY_WindowPtr(window,local_y,center_y_ratio);}
void igSetScrollX(float scroll_x){igSetScrollX_Float(scroll_x);}
void igSetScrollX(ImGuiWindow* window,float scroll_x){igSetScrollX_WindowPtr(window,scroll_x);}
void igSetScrollY(float scroll_y){igSetScrollY_Float(scroll_y);}
void igSetScrollY(ImGuiWindow* window,float scroll_y){igSetScrollY_WindowPtr(window,scroll_y);}
void igSetWindowCollapsed(bool collapsed,ImGuiCond cond){igSetWindowCollapsed_Bool(collapsed,cond);}
void igSetWindowCollapsed(const (char)* name,bool collapsed,ImGuiCond cond){igSetWindowCollapsed_Str(name,collapsed,cond);}
void igSetWindowCollapsed(ImGuiWindow* window,bool collapsed,ImGuiCond cond){igSetWindowCollapsed_WindowPtr(window,collapsed,cond);}
void igSetWindowFocus(){igSetWindowFocus_Nil();}
void igSetWindowFocus(const (char)* name){igSetWindowFocus_Str(name);}
void igSetWindowPos(const ImVec2 pos,ImGuiCond cond){igSetWindowPos_Vec2(pos,cond);}
void igSetWindowPos(const (char)* name,const ImVec2 pos,ImGuiCond cond){igSetWindowPos_Str(name,pos,cond);}
void igSetWindowPos(ImGuiWindow* window,const ImVec2 pos,ImGuiCond cond){igSetWindowPos_WindowPtr(window,pos,cond);}
void igSetWindowSize(const ImVec2 size,ImGuiCond cond){igSetWindowSize_Vec2(size,cond);}
void igSetWindowSize(const (char)* name,const ImVec2 size,ImGuiCond cond){igSetWindowSize_Str(name,size,cond);}
void igSetWindowSize(ImGuiWindow* window,const ImVec2 size,ImGuiCond cond){igSetWindowSize_WindowPtr(window,size,cond);}
void igTableGcCompactTransientBuffers(ImGuiTable* table){igTableGcCompactTransientBuffers_TablePtr(table);}
void igTableGcCompactTransientBuffers(ImGuiTableTempData* table){igTableGcCompactTransientBuffers_TableTempDataPtr(table);}
const (char*) igTableGetColumnName(int column_n){return igTableGetColumnName_Int(column_n);}
const (char*) igTableGetColumnName(const ImGuiTable* table,int column_n){return igTableGetColumnName_TablePtr(table,column_n);}
/**
*	bool igTreeNode(const (char)* label)
*	bool igTreeNode(const (char)* str_id,const (char)* fmt,...)
*	bool igTreeNode(const void* ptr_id,const (char)* fmt,...)
*/
alias igTreeNode= overload!(igTreeNode_Str,igTreeNode_StrStr,igTreeNode_Ptr);
/**
*	bool igTreeNodeEx(const (char)* label,ImGuiTreeNodeFlags flags)
*	bool igTreeNodeEx(const (char)* str_id,ImGuiTreeNodeFlags flags,const (char)* fmt,...)
*	bool igTreeNodeEx(const void* ptr_id,ImGuiTreeNodeFlags flags,const (char)* fmt,...)
*/
alias igTreeNodeEx= overload!(igTreeNodeEx_Str,igTreeNodeEx_StrStr,igTreeNodeEx_Ptr);
bool igTreeNodeExV(const (char)* str_id,ImGuiTreeNodeFlags flags,const (char)* fmt,va_list args){return igTreeNodeExV_Str(str_id,flags,fmt,args);}
bool igTreeNodeExV(const void* ptr_id,ImGuiTreeNodeFlags flags,const (char)* fmt,va_list args){return igTreeNodeExV_Ptr(ptr_id,flags,fmt,args);}
bool igTreeNodeV(const (char)* str_id,const (char)* fmt,va_list args){return igTreeNodeV_Str(str_id,fmt,args);}
bool igTreeNodeV(const void* ptr_id,const (char)* fmt,va_list args){return igTreeNodeV_Ptr(ptr_id,fmt,args);}
void igTreePush(const (char)* str_id){igTreePush_Str(str_id);}
void igTreePush(const void* ptr_id){igTreePush_Ptr(ptr_id);}
void igValue(const (char)* prefix,bool b){igValue_Bool(prefix,b);}
void igValue(const (char)* prefix,int v){igValue_Int(prefix,v);}
void igValue(const (char)* prefix,uint v){igValue_Uint(prefix,v);}
void igValue(const (char)* prefix,float v,const (char)* float_format){igValue_Float(prefix,v,float_format);}
