module bindbc.cimgui.types;
import core.stdc.stdio:_iobuf;
import core.stdc.config;
import core.stdc.stdarg: va_list;
static import core.simd;
static import std.conv;

struct Int128 { long lower; long upper; }
struct UInt128 { ulong lower; ulong upper; }

struct __locale_data { int dummy; }



alias _Bool = bool;
struct dpp {
    static struct Opaque(int N) {
        void[N] bytes;
    }

    static bool isEmpty(T)() {
        return T.tupleof.length == 0;
    }
    static struct Move(T) {
        T* ptr;
    }


    static auto move(T)(ref T value) {
        return Move!T(&value);
    }
    mixin template EnumD(string name, T, string prefix) if(is(T == enum)) {
        private static string _memberMixinStr(string member) {
            import std.conv: text;
            import std.array: replace;
            return text(` `, member.replace(prefix, ""), ` = `, T.stringof, `.`, member, `,`);
        }
        private static string _enumMixinStr() {
            import std.array: join;
            string[] ret;
            ret ~= "enum " ~ name ~ "{";
            static foreach(member; __traits(allMembers, T)) {
                ret ~= _memberMixinStr(member);
            }
            ret ~= "}";
            return ret.join("\n");
        }
        mixin(_enumMixinStr());
    }
}

extern(C++)
{
    alias int8_t = byte;
    alias int16_t = short;
    alias int32_t = int;
    alias int64_t = long;
    alias uint8_t = ubyte;
    alias uint16_t = ushort;
    alias uint32_t = uint;
    alias uint64_t = ulong;
    alias int_least8_t = byte;
    alias int_least16_t = short;
    alias int_least32_t = int;
    alias int_least64_t = long;
    alias uint_least8_t = ubyte;
    alias uint_least16_t = ushort;
    alias uint_least32_t = uint;
    alias uint_least64_t = ulong;
    alias int_fast8_t = byte;
    alias int_fast16_t = int;
    alias int_fast32_t = int;
    alias int_fast64_t = long;
    alias uint_fast8_t = ubyte;
    alias uint_fast16_t = uint;
    alias uint_fast32_t = uint;
    alias uint_fast64_t = ulong;
    alias intmax_t = long;
    alias uintmax_t = ulong;
    alias ImU64 = ulong;
    struct ImGuiTableColumnSettings
    {
        import std.bitmanip: bitfields;

        align(4):
        float WidthOrWeight;
        uint UserID;
        byte Index;
        byte DisplayOrder;
        byte SortOrder;
        mixin(bitfields!(
            ubyte, "SortDirection", 2,
            ubyte, "IsEnabled", 1,
            ubyte, "IsStretch", 1,
            uint, "_padding_0", 4
        ));
    }
    struct ImGuiTableCellData
    {
        uint BgColor;
        byte Column;
    }
    struct ImGuiViewportP
    {
        ImGuiViewport _ImGuiViewport;
        int Idx;
        int LastFrameActive;
        int LastFrontMostStampCount;
        uint LastNameHash;
        ImVec2 LastPos;
        float Alpha;
        float LastAlpha;
        short PlatformMonitor;
        bool PlatformWindowCreated;
        ImGuiWindow* Window;
        int[2] DrawListsLastFrame;
        ImDrawList*[2] DrawLists;
        ImDrawData DrawDataP;
        ImDrawDataBuilder DrawDataBuilder;
        ImVec2 LastPlatformPos;
        ImVec2 LastPlatformSize;
        ImVec2 LastRendererSize;
        ImVec2 WorkOffsetMin;
        ImVec2 WorkOffsetMax;
        ImVec2 BuildWorkOffsetMin;
        ImVec2 BuildWorkOffsetMax;
    }
    struct ImGuiWindowDockStyle
    {
        uint[6] Colors;
    }
    struct ImGuiPtrOrIndex
    {
        void* Ptr;
        int Index;
    }
    struct ImGuiShrinkWidthItem
    {
        int Index;
        float Width;
    }
    struct ImGuiWindowStackData
    {
        ImGuiWindow* Window;
        ImGuiLastItemData ParentLastItemDataBackup;
    }
    struct ImGuiComboPreviewData
    {
        ImRect PreviewRect;
        ImVec2 BackupCursorPos;
        ImVec2 BackupCursorMaxPos;
        ImVec2 BackupCursorPosPrevLine;
        float BackupPrevLineTextBaseOffset;
        int BackupLayout;
    }
    struct ImGuiDataTypeTempStorage
    {
        ubyte[8] Data;
    }
    struct ImVec2ih
    {
        short x;
        short y;
    }
    struct ImVec1
    {
        float x;
    }
    struct StbTexteditRow
    {
        float x0;
        float x1;
        float baseline_y_delta;
        float ymin;
        float ymax;
        int num_chars;
    }
    struct STB_TexteditState
    {
        int cursor;
        int select_start;
        int select_end;
        ubyte insert_mode;
        int row_count_per_page;
        ubyte cursor_at_end_of_line;
        ubyte initialized;
        ubyte has_preferred_x;
        ubyte single_line;
        ubyte padding1;
        ubyte padding2;
        ubyte padding3;
        float preferred_x;
        StbUndoState undostate;
    }
    struct StbUndoState
    {
        StbUndoRecord[99] undo_rec;
        ushort[999] undo_char;
        short undo_point;
        short redo_point;
        int undo_char_point;
        int redo_char_point;
    }
    struct StbUndoRecord
    {
        int where;
        int insert_length;
        int delete_length;
        int char_storage;
    }
    struct ImGuiWindowSettings
    {
        uint ID;
        ImVec2ih Pos;
        ImVec2ih Size;
        ImVec2ih ViewportPos;
        uint ViewportId;
        uint DockId;
        uint ClassId;
        short DockOrder;
        bool Collapsed;
        bool WantApply;
    }
    struct ImGuiWindowTempData
    {
        ImVec2 CursorPos;
        ImVec2 CursorPosPrevLine;
        ImVec2 CursorStartPos;
        ImVec2 CursorMaxPos;
        ImVec2 IdealMaxPos;
        ImVec2 CurrLineSize;
        ImVec2 PrevLineSize;
        float CurrLineTextBaseOffset;
        float PrevLineTextBaseOffset;
        ImVec1 Indent;
        ImVec1 ColumnsOffset;
        ImVec1 GroupOffset;
        ImGuiNavLayer NavLayerCurrent;
        short NavLayersActiveMask;
        short NavLayersActiveMaskNext;
        uint NavFocusScopeIdCurrent;
        bool NavHideHighlightOneFrame;
        bool NavHasScroll;
        bool MenuBarAppending;
        ImVec2 MenuBarOffset;
        ImGuiMenuColumns MenuColumns;
        int TreeDepth;
        uint TreeJumpToParentOnPopMask;
        ImVector_ImGuiWindowPtr ChildWindows;
        ImGuiStorage* StateStorage;
        ImGuiOldColumns* CurrentColumns;
        int CurrentTableIdx;
        int LayoutType;
        int ParentLayoutType;
        int FocusCounterRegular;
        int FocusCounterTabStop;
        float ItemWidth;
        float TextWrapPos;
        ImVector_float ItemWidthStack;
        ImVector_float TextWrapPosStack;
        ImGuiStackSizes StackSizesOnBegin;
    }
    struct ImGuiWindow
    {
        import std.bitmanip: bitfields;

        align(4):
        char* Name;
        uint ID;
        int Flags;
        int FlagsPreviousFrame;
        ImGuiWindowClass WindowClass;
        ImGuiViewportP* Viewport;
        uint ViewportId;
        ImVec2 ViewportPos;
        int ViewportAllowPlatformMonitorExtend;
        ImVec2 Pos;
        ImVec2 Size;
        ImVec2 SizeFull;
        ImVec2 ContentSize;
        ImVec2 ContentSizeIdeal;
        ImVec2 ContentSizeExplicit;
        ImVec2 WindowPadding;
        float WindowRounding;
        float WindowBorderSize;
        int NameBufLen;
        uint MoveId;
        uint ChildId;
        ImVec2 Scroll;
        ImVec2 ScrollMax;
        ImVec2 ScrollTarget;
        ImVec2 ScrollTargetCenterRatio;
        ImVec2 ScrollTargetEdgeSnapDist;
        ImVec2 ScrollbarSizes;
        bool ScrollbarX;
        bool ScrollbarY;
        bool ViewportOwned;
        bool Active;
        bool WasActive;
        bool WriteAccessed;
        bool Collapsed;
        bool WantCollapseToggle;
        bool SkipItems;
        bool Appearing;
        bool Hidden;
        bool IsFallbackWindow;
        bool HasCloseButton;
        byte ResizeBorderHeld;
        short BeginCount;
        short BeginOrderWithinParent;
        short BeginOrderWithinContext;
        short FocusOrder;
        uint PopupId;
        byte AutoFitFramesX;
        byte AutoFitFramesY;
        byte AutoFitChildAxises;
        bool AutoFitOnlyGrows;
        int AutoPosLastDirection;
        byte HiddenFramesCanSkipItems;
        byte HiddenFramesCannotSkipItems;
        byte HiddenFramesForRenderOnly;
        byte DisableInputsFrames;
        mixin(bitfields!(
            int, "SetWindowPosAllowFlags", 8,
            int, "SetWindowSizeAllowFlags", 8,
            int, "SetWindowCollapsedAllowFlags", 8,
            int, "SetWindowDockAllowFlags", 8,
        ));
        ImVec2 SetWindowPosVal;
        ImVec2 SetWindowPosPivot;
        ImVector_ImGuiID IDStack;
        ImGuiWindowTempData DC;
        ImRect OuterRectClipped;
        ImRect InnerRect;
        ImRect InnerClipRect;
        ImRect WorkRect;
        ImRect ParentWorkRect;
        ImRect ClipRect;
        ImRect ContentRegionRect;
        ImVec2ih HitTestHoleSize;
        ImVec2ih HitTestHoleOffset;
        int LastFrameActive;
        int LastFrameJustFocused;
        float LastTimeActive;
        float ItemWidthDefault;
        ImGuiStorage StateStorage;
        ImVector_ImGuiOldColumns ColumnsStorage;
        float FontWindowScale;
        float FontDpiScale;
        int SettingsOffset;
        ImDrawList* DrawList;
        ImDrawList DrawListInst;
        ImGuiWindow* ParentWindow;
        ImGuiWindow* RootWindow;
        ImGuiWindow* RootWindowDockTree;
        ImGuiWindow* RootWindowForTitleBarHighlight;
        ImGuiWindow* RootWindowForNav;
        ImGuiWindow* NavLastChildNavWindow;
        uint[2] NavLastIds;
        ImRect[2] NavRectRel;
        int MemoryDrawListIdxCapacity;
        int MemoryDrawListVtxCapacity;
        bool MemoryCompacted;
        mixin(bitfields!(
            bool, "DockIsActive", 1,
            bool, "DockNodeIsVisible", 1,
            bool, "DockTabIsVisible", 1,
            bool, "DockTabWantClose", 1,
            uint, "_padding_0", 4
        ));
        short DockOrder;
        ImGuiWindowDockStyle DockStyle;
        ImGuiDockNode* DockNode;
        ImGuiDockNode* DockNodeAsHost;
        uint DockId;
        int DockTabItemStatusFlags;
        ImRect DockTabItemRect;
    }
    struct ImGuiTableColumnsSettings;
    struct ImGuiTableSettings
    {
        uint ID;
        int SaveFlags;
        float RefScale;
        byte ColumnsCount;
        byte ColumnsCountMax;
        bool WantApply;
    }
    struct ImGuiTableTempData
    {
        int TableIndex;
        float LastTimeActive;
        ImVec2 UserOuterSize;
        ImDrawListSplitter DrawSplitter;
        ImRect HostBackupWorkRect;
        ImRect HostBackupParentWorkRect;
        ImVec2 HostBackupPrevLineSize;
        ImVec2 HostBackupCurrLineSize;
        ImVec2 HostBackupCursorMaxPos;
        ImVec1 HostBackupColumnsOffset;
        float HostBackupItemWidth;
        int HostBackupItemWidthStackSize;
    }
    struct ImGuiTableColumn
    {
        import std.bitmanip: bitfields;

        align(4):
        int Flags;
        float WidthGiven;
        float MinX;
        float MaxX;
        float WidthRequest;
        float WidthAuto;
        float StretchWeight;
        float InitStretchWeightOrWidth;
        ImRect ClipRect;
        uint UserID;
        float WorkMinX;
        float WorkMaxX;
        float ItemWidth;
        float ContentMaxXFrozen;
        float ContentMaxXUnfrozen;
        float ContentMaxXHeadersUsed;
        float ContentMaxXHeadersIdeal;
        short NameOffset;
        byte DisplayOrder;
        byte IndexWithinEnabledSet;
        byte PrevEnabledColumn;
        byte NextEnabledColumn;
        byte SortOrder;
        ubyte DrawChannelCurrent;
        ubyte DrawChannelFrozen;
        ubyte DrawChannelUnfrozen;
        bool IsEnabled;
        bool IsUserEnabled;
        bool IsUserEnabledNextFrame;
        bool IsVisibleX;
        bool IsVisibleY;
        bool IsRequestOutput;
        bool IsSkipItems;
        bool IsPreserveWidthAuto;
        byte NavLayerCurrent;
        ubyte AutoFitQueue;
        ubyte CannotSkipItemsQueue;
        mixin(bitfields!(
            ubyte, "SortDirection", 2,
            ubyte, "SortDirectionsAvailCount", 2,
            ubyte, "SortDirectionsAvailMask", 4,
        ));
        ubyte SortDirectionsAvailList;
    }
    struct ImGuiTable
    {
        import std.bitmanip: bitfields;

        align(4):
        uint ID;
        int Flags;
        void* RawData;
        ImGuiTableTempData* TempData;
        ImSpan_ImGuiTableColumn Columns;
        ImSpan_ImGuiTableColumnIdx DisplayOrderToIndex;
        ImSpan_ImGuiTableCellData RowCellData;
        ulong EnabledMaskByDisplayOrder;
        ulong EnabledMaskByIndex;
        ulong VisibleMaskByIndex;
        ulong RequestOutputMaskByIndex;
        int SettingsLoadedFlags;
        int SettingsOffset;
        int LastFrameActive;
        int ColumnsCount;
        int CurrentRow;
        int CurrentColumn;
        short InstanceCurrent;
        short InstanceInteracted;
        float RowPosY1;
        float RowPosY2;
        float RowMinHeight;
        float RowTextBaseline;
        float RowIndentOffsetX;
        mixin(bitfields!(
            int, "RowFlags", 16,
            int, "LastRowFlags", 16,
        ));
        int RowBgColorCounter;
        uint[2] RowBgColor;
        uint BorderColorStrong;
        uint BorderColorLight;
        float BorderX1;
        float BorderX2;
        float HostIndentX;
        float MinColumnWidth;
        float OuterPaddingX;
        float CellPaddingX;
        float CellPaddingY;
        float CellSpacingX1;
        float CellSpacingX2;
        float LastOuterHeight;
        float LastFirstRowHeight;
        float InnerWidth;
        float ColumnsGivenWidth;
        float ColumnsAutoFitWidth;
        float ResizedColumnNextWidth;
        float ResizeLockMinContentsX2;
        float RefScale;
        ImRect OuterRect;
        ImRect InnerRect;
        ImRect WorkRect;
        ImRect InnerClipRect;
        ImRect BgClipRect;
        ImRect Bg0ClipRectForDrawCmd;
        ImRect Bg2ClipRectForDrawCmd;
        ImRect HostClipRect;
        ImRect HostBackupInnerClipRect;
        ImGuiWindow* OuterWindow;
        ImGuiWindow* InnerWindow;
        ImGuiTextBuffer ColumnsNames;
        ImDrawListSplitter* DrawSplitter;
        ImGuiTableColumnSortSpecs SortSpecsSingle;
        ImVector_ImGuiTableColumnSortSpecs SortSpecsMulti;
        ImGuiTableSortSpecs SortSpecs;
        byte SortSpecsCount;
        byte ColumnsEnabledCount;
        byte ColumnsEnabledFixedCount;
        byte DeclColumnsCount;
        byte HoveredColumnBody;
        byte HoveredColumnBorder;
        byte AutoFitSingleColumn;
        byte ResizedColumn;
        byte LastResizedColumn;
        byte HeldHeaderColumn;
        byte ReorderColumn;
        byte ReorderColumnDir;
        byte LeftMostEnabledColumn;
        byte RightMostEnabledColumn;
        byte LeftMostStretchedColumn;
        byte RightMostStretchedColumn;
        byte ContextPopupColumn;
        byte FreezeRowsRequest;
        byte FreezeRowsCount;
        byte FreezeColumnsRequest;
        byte FreezeColumnsCount;
        byte RowCellDataCurrent;
        ubyte DummyDrawChannel;
        ubyte Bg2DrawChannelCurrent;
        ubyte Bg2DrawChannelUnfrozen;
        bool IsLayoutLocked;
        bool IsInsideRow;
        bool IsInitializing;
        bool IsSortSpecsDirty;
        bool IsUsingHeaders;
        bool IsContextPopupOpen;
        bool IsSettingsRequestLoad;
        bool IsSettingsDirty;
        bool IsDefaultDisplayOrder;
        bool IsResetAllRequest;
        bool IsResetDisplayOrderRequest;
        bool IsUnfrozenRows;
        bool IsDefaultSizingPolicy;
        bool MemoryCompacted;
        bool HostSkipItems;
    }
    struct ImGuiTabItem
    {
        uint ID;
        int Flags;
        ImGuiWindow* Window;
        int LastFrameVisible;
        int LastFrameSelected;
        float Offset;
        float Width;
        float ContentWidth;
        int NameOffset;
        short BeginOrder;
        short IndexDuringLayout;
        bool WantClose;
    }
    struct ImGuiTabBar
    {
        ImVector_ImGuiTabItem Tabs;
        int Flags;
        uint ID;
        uint SelectedTabId;
        uint NextSelectedTabId;
        uint VisibleTabId;
        int CurrFrameVisible;
        int PrevFrameVisible;
        ImRect BarRect;
        float CurrTabsContentsHeight;
        float PrevTabsContentsHeight;
        float WidthAllTabs;
        float WidthAllTabsIdeal;
        float ScrollingAnim;
        float ScrollingTarget;
        float ScrollingTargetDistToVisibility;
        float ScrollingSpeed;
        float ScrollingRectMinX;
        float ScrollingRectMaxX;
        uint ReorderRequestTabId;
        short ReorderRequestOffset;
        byte BeginCount;
        bool WantLayout;
        bool VisibleTabWasSubmitted;
        bool TabsAddedNew;
        short TabsActiveCount;
        short LastTabItemIdx;
        float ItemSpacingY;
        ImVec2 FramePadding;
        ImVec2 BackupCursorPos;
        ImGuiTextBuffer TabsNames;
    }
    struct ImGuiStyleMod
    {
        int VarIdx;
        static union _Anonymous_0
        {
            int[2] BackupInt;
            float[2] BackupFloat;
        }
        _Anonymous_0 _anonymous_1;
        auto BackupInt() @property @nogc pure nothrow { return _anonymous_1.BackupInt; }
        void BackupInt(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_1.BackupInt = val; }
        auto BackupFloat() @property @nogc pure nothrow { return _anonymous_1.BackupFloat; }
        void BackupFloat(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_1.BackupFloat = val; }
    }
    struct ImGuiStackSizes
    {
        short SizeOfIDStack;
        short SizeOfColorStack;
        short SizeOfStyleVarStack;
        short SizeOfFontStack;
        short SizeOfFocusScopeStack;
        short SizeOfGroupStack;
        short SizeOfBeginPopupStack;
    }
    struct ImGuiSettingsHandler
    {
        const(char)* TypeName;
        uint TypeHash;
        void function(ImGuiContext*, ImGuiSettingsHandler*) ClearAllFn;
        void function(ImGuiContext*, ImGuiSettingsHandler*) ReadInitFn;
        void* function(ImGuiContext*, ImGuiSettingsHandler*, const(char)*) ReadOpenFn;
        void function(ImGuiContext*, ImGuiSettingsHandler*, void*, const(char)*) ReadLineFn;
        void function(ImGuiContext*, ImGuiSettingsHandler*) ApplyAllFn;
        void function(ImGuiContext*, ImGuiSettingsHandler*, ImGuiTextBuffer*) WriteAllFn;
        void* UserData;
    }
    struct ImGuiPopupData
    {
        uint PopupId;
        ImGuiWindow* Window;
        ImGuiWindow* SourceWindow;
        int OpenFrameCount;
        uint OpenParentId;
        ImVec2 OpenPopupPos;
        ImVec2 OpenMousePos;
    }
    struct ImGuiOldColumns
    {
        uint ID;
        int Flags;
        bool IsFirstFrame;
        bool IsBeingResized;
        int Current;
        int Count;
        float OffMinX;
        float OffMaxX;
        float LineMinY;
        float LineMaxY;
        float HostCursorPosY;
        float HostCursorMaxPosX;
        ImRect HostInitialClipRect;
        ImRect HostBackupClipRect;
        ImRect HostBackupParentWorkRect;
        ImVector_ImGuiOldColumnData Columns;
        ImDrawListSplitter Splitter;
    }
    struct ImGuiOldColumnData
    {
        float OffsetNorm;
        float OffsetNormBeforeResize;
        int Flags;
        ImRect ClipRect;
    }
    struct ImGuiNextItemData
    {
        int Flags;
        float Width;
        uint FocusScopeId;
        int OpenCond;
        bool OpenVal;
    }
    struct ImGuiNextWindowData
    {
        int Flags;
        int PosCond;
        int SizeCond;
        int CollapsedCond;
        int DockCond;
        ImVec2 PosVal;
        ImVec2 PosPivotVal;
        ImVec2 SizeVal;
        ImVec2 ContentSizeVal;
        ImVec2 ScrollVal;
        bool PosUndock;
        bool CollapsedVal;
        ImRect SizeConstraintRect;
        void function(ImGuiSizeCallbackData*) SizeCallback;
        void* SizeCallbackUserData;
        float BgAlphaVal;
        uint ViewportId;
        uint DockId;
        ImGuiWindowClass WindowClass;
        ImVec2 MenuBarOffsetMinVal;
    }
    struct ImGuiMetricsConfig
    {
        bool ShowWindowsRects;
        bool ShowWindowsBeginOrder;
        bool ShowTablesRects;
        bool ShowDrawCmdMesh;
        bool ShowDrawCmdBoundingBoxes;
        bool ShowDockingNodes;
        int ShowWindowsRectsType;
        int ShowTablesRectsType;
    }
    struct ImGuiNavItemData
    {
        ImGuiWindow* Window;
        uint ID;
        uint FocusScopeId;
        ImRect RectRel;
        float DistBox;
        float DistCenter;
        float DistAxial;
    }
    struct ImGuiMenuColumns
    {
        uint TotalWidth;
        uint NextTotalWidth;
        ushort Spacing;
        ushort OffsetIcon;
        ushort OffsetLabel;
        ushort OffsetShortcut;
        ushort OffsetMark;
        ushort[4] Widths;
    }
    struct ImGuiLastItemData
    {
        uint ID;
        int InFlags;
        int StatusFlags;
        ImRect Rect;
        ImRect DisplayRect;
    }
    struct ImGuiInputTextState
    {
        uint ID;
        int CurLenW;
        int CurLenA;
        ImVector_ImWchar TextW;
        ImVector_char TextA;
        ImVector_char InitialTextA;
        bool TextAIsValid;
        int BufCapacityA;
        float ScrollX;
        STB_TexteditState Stb;
        float CursorAnim;
        bool CursorFollow;
        bool SelectedAllMouseLock;
        bool Edited;
        int Flags;
        int function(ImGuiInputTextCallbackData*) UserCallback;
        void* UserCallbackData;
    }
    struct ImGuiGroupData
    {
        uint WindowID;
        ImVec2 BackupCursorPos;
        ImVec2 BackupCursorMaxPos;
        ImVec1 BackupIndent;
        ImVec1 BackupGroupOffset;
        ImVec2 BackupCurrLineSize;
        float BackupCurrLineTextBaseOffset;
        uint BackupActiveIdIsAlive;
        bool BackupActiveIdPreviousFrameIsAlive;
        bool BackupHoveredIdIsAlive;
        bool EmitItem;
    }
    struct ImGuiDockNodeSettings;
    struct ImGuiDockNode
    {
        import std.bitmanip: bitfields;

        align(4):
        uint ID;
        int SharedFlags;
        int LocalFlags;
        int LocalFlagsInWindows;
        int MergedFlags;
        ImGuiDockNodeState State;
        ImGuiDockNode* ParentNode;
        ImGuiDockNode*[2] ChildNodes;
        ImVector_ImGuiWindowPtr Windows;
        ImGuiTabBar* TabBar;
        ImVec2 Pos;
        ImVec2 Size;
        ImVec2 SizeRef;
        ImGuiAxis SplitAxis;
        ImGuiWindowClass WindowClass;
        ImGuiWindow* HostWindow;
        ImGuiWindow* VisibleWindow;
        ImGuiDockNode* CentralNode;
        ImGuiDockNode* OnlyNodeWithWindows;
        int LastFrameAlive;
        int LastFrameActive;
        int LastFrameFocused;
        uint LastFocusedNodeId;
        uint SelectedTabId;
        uint WantCloseTabId;
        mixin(bitfields!(
            int, "AuthorityForPos", 3,
            int, "AuthorityForSize", 3,
            int, "AuthorityForViewport", 3,
            bool, "IsVisible", 1,
            bool, "IsFocused", 1,
            bool, "HasCloseButton", 1,
            bool, "HasWindowMenuButton", 1,
            bool, "WantCloseAll", 1,
            bool, "WantLockSizeOnce", 1,
            bool, "WantMouseMove", 1,
            bool, "WantHiddenTabBarUpdate", 1,
            bool, "WantHiddenTabBarToggle", 1,
            bool, "MarkedForPosSizeWrite", 1,
            uint, "_padding_0", 13
        ));
    }
    struct ImGuiDockRequest;
    struct ImGuiDockContext
    {
        ImGuiStorage Nodes;
        ImVector_ImGuiDockRequest Requests;
        ImVector_ImGuiDockNodeSettings NodesSettings;
        bool WantFullRebuild;
    }
    struct ImGuiDataTypeInfo
    {
        ulong Size;
        const(char)* Name;
        const(char)* PrintFmt;
        const(char)* ScanFmt;
    }
    struct ImGuiContextHook
    {
        uint HookId;
        ImGuiContextHookType Type;
        uint Owner;
        void function(ImGuiContext*, ImGuiContextHook*) Callback;
        void* UserData;
    }
    struct ImGuiColorMod
    {
        int Col;
        ImVec4 BackupValue;
    }
    struct ImDrawDataBuilder
    {
        ImVector_ImDrawListPtr[2] Layers;
    }
    struct ImRect
    {
        ImVec2 Min;
        ImVec2 Max;
    }
    struct ImBitVector
    {
        ImVector_ImU32 Storage;
    }
    struct ImFontAtlasCustomRect
    {
        ushort Width;
        ushort Height;
        ushort X;
        ushort Y;
        uint GlyphID;
        float GlyphAdvanceX;
        ImVec2 GlyphOffset;
        ImFont* Font;
    }
    struct ImDrawCmdHeader
    {
        ImVec4 ClipRect;
        void* TextureId;
        uint VtxOffset;
    }
    struct ImGuiStoragePair
    {
        uint key;
        static union _Anonymous_2
        {
            int val_i;
            float val_f;
            void* val_p;
        }
        _Anonymous_2 _anonymous_3;
        auto val_i() @property @nogc pure nothrow { return _anonymous_3.val_i; }
        void val_i(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_3.val_i = val; }
        auto val_f() @property @nogc pure nothrow { return _anonymous_3.val_f; }
        void val_f(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_3.val_f = val; }
        auto val_p() @property @nogc pure nothrow { return _anonymous_3.val_p; }
        void val_p(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_3.val_p = val; }
    }
    struct ImGuiTextRange
    {
        const(char)* b;
        const(char)* e;
    }
    struct ImVec4
    {
        float x;
        float y;
        float z;
        float w;
    }
    struct ImVec2
    {
        float x;
        float y;
    }
    struct ImGuiWindowClass
    {
        uint ClassId;
        uint ParentViewportId;
        int ViewportFlagsOverrideSet;
        int ViewportFlagsOverrideClear;
        int TabItemFlagsOverrideSet;
        int DockNodeFlagsOverrideSet;
        bool DockingAlwaysTabBar;
        bool DockingAllowUnclassed;
    }
    struct ImGuiViewport
    {
        uint ID;
        int Flags;
        ImVec2 Pos;
        ImVec2 Size;
        ImVec2 WorkPos;
        ImVec2 WorkSize;
        float DpiScale;
        uint ParentViewportId;
        ImDrawData* DrawData;
        void* RendererUserData;
        void* PlatformUserData;
        void* PlatformHandle;
        void* PlatformHandleRaw;
        bool PlatformRequestMove;
        bool PlatformRequestResize;
        bool PlatformRequestClose;
    }
    struct ImGuiTextFilter
    {
        char[256] InputBuf;
        ImVector_ImGuiTextRange Filters;
        int CountGrep;
    }
    struct ImGuiTextBuffer
    {
        ImVector_char Buf;
    }
    struct ImGuiTableColumnSortSpecs
    {
        import std.bitmanip: bitfields;

        align(4):
        uint ColumnUserID;
        short ColumnIndex;
        short SortOrder;
        mixin(bitfields!(
            int, "SortDirection", 8,
        ));
    }
    struct ImGuiTableSortSpecs
    {
        const(ImGuiTableColumnSortSpecs)* Specs;
        int SpecsCount;
        bool SpecsDirty;
    }
    struct ImGuiStyle
    {
        float Alpha;
        float DisabledAlpha;
        ImVec2 WindowPadding;
        float WindowRounding;
        float WindowBorderSize;
        ImVec2 WindowMinSize;
        ImVec2 WindowTitleAlign;
        int WindowMenuButtonPosition;
        float ChildRounding;
        float ChildBorderSize;
        float PopupRounding;
        float PopupBorderSize;
        ImVec2 FramePadding;
        float FrameRounding;
        float FrameBorderSize;
        ImVec2 ItemSpacing;
        ImVec2 ItemInnerSpacing;
        ImVec2 CellPadding;
        ImVec2 TouchExtraPadding;
        float IndentSpacing;
        float ColumnsMinSpacing;
        float ScrollbarSize;
        float ScrollbarRounding;
        float GrabMinSize;
        float GrabRounding;
        float LogSliderDeadzone;
        float TabRounding;
        float TabBorderSize;
        float TabMinWidthForCloseButton;
        int ColorButtonPosition;
        ImVec2 ButtonTextAlign;
        ImVec2 SelectableTextAlign;
        ImVec2 DisplayWindowPadding;
        ImVec2 DisplaySafeAreaPadding;
        float MouseCursorScale;
        bool AntiAliasedLines;
        bool AntiAliasedLinesUseTex;
        bool AntiAliasedFill;
        float CurveTessellationTol;
        float CircleTessellationMaxError;
        ImVec4[55] Colors;
    }
    struct ImGuiStorage
    {
        ImVector_ImGuiStoragePair Data;
    }
    struct ImGuiSizeCallbackData
    {
        void* UserData;
        ImVec2 Pos;
        ImVec2 CurrentSize;
        ImVec2 DesiredSize;
    }
    struct ImGuiPlatformMonitor
    {
        ImVec2 MainPos;
        ImVec2 MainSize;
        ImVec2 WorkPos;
        ImVec2 WorkSize;
        float DpiScale;
    }
    struct ImGuiPlatformIO
    {
        void function(ImGuiViewport*) Platform_CreateWindow;
        void function(ImGuiViewport*) Platform_DestroyWindow;
        void function(ImGuiViewport*) Platform_ShowWindow;
        void function(ImGuiViewport*, ImVec2) Platform_SetWindowPos;
        ImVec2 function(ImGuiViewport*) Platform_GetWindowPos;
        void function(ImGuiViewport*, ImVec2) Platform_SetWindowSize;
        ImVec2 function(ImGuiViewport*) Platform_GetWindowSize;
        void function(ImGuiViewport*) Platform_SetWindowFocus;
        bool function(ImGuiViewport*) Platform_GetWindowFocus;
        bool function(ImGuiViewport*) Platform_GetWindowMinimized;
        void function(ImGuiViewport*, const(char)*) Platform_SetWindowTitle;
        void function(ImGuiViewport*, float) Platform_SetWindowAlpha;
        void function(ImGuiViewport*) Platform_UpdateWindow;
        void function(ImGuiViewport*, void*) Platform_RenderWindow;
        void function(ImGuiViewport*, void*) Platform_SwapBuffers;
        float function(ImGuiViewport*) Platform_GetWindowDpiScale;
        void function(ImGuiViewport*) Platform_OnChangedViewport;
        void function(ImGuiViewport*, ImVec2) Platform_SetImeInputPos;
        int function(ImGuiViewport*, ulong, const(void)*, ulong*) Platform_CreateVkSurface;
        void function(ImGuiViewport*) Renderer_CreateWindow;
        void function(ImGuiViewport*) Renderer_DestroyWindow;
        void function(ImGuiViewport*, ImVec2) Renderer_SetWindowSize;
        void function(ImGuiViewport*, void*) Renderer_RenderWindow;
        void function(ImGuiViewport*, void*) Renderer_SwapBuffers;
        ImVector_ImGuiPlatformMonitor Monitors;
        ImVector_ImGuiViewportPtr Viewports;
    }
    struct ImGuiPayload
    {
        void* Data;
        int DataSize;
        uint SourceId;
        uint SourceParentId;
        int DataFrameCount;
        char[33] DataType;
        bool Preview;
        bool Delivery;
    }
    struct ImGuiOnceUponAFrame
    {
        int RefFrame;
    }
    struct ImGuiListClipper
    {
        int DisplayStart;
        int DisplayEnd;
        int ItemsCount;
        int StepNo;
        int ItemsFrozen;
        float ItemsHeight;
        float StartPosY;
    }
    struct ImGuiInputTextCallbackData
    {
        int EventFlag;
        int Flags;
        void* UserData;
        ushort EventChar;
        int EventKey;
        char* Buf;
        int BufTextLen;
        int BufSize;
        bool BufDirty;
        int CursorPos;
        int SelectionStart;
        int SelectionEnd;
    }
    struct ImGuiIO
    {
        int ConfigFlags;
        int BackendFlags;
        ImVec2 DisplaySize;
        float DeltaTime;
        float IniSavingRate;
        const(char)* IniFilename;
        const(char)* LogFilename;
        float MouseDoubleClickTime;
        float MouseDoubleClickMaxDist;
        float MouseDragThreshold;
        int[22] KeyMap;
        float KeyRepeatDelay;
        float KeyRepeatRate;
        void* UserData;
        ImFontAtlas* Fonts;
        float FontGlobalScale;
        bool FontAllowUserScaling;
        ImFont* FontDefault;
        ImVec2 DisplayFramebufferScale;
        bool ConfigDockingNoSplit;
        bool ConfigDockingAlwaysTabBar;
        bool ConfigDockingTransparentPayload;
        bool ConfigViewportsNoAutoMerge;
        bool ConfigViewportsNoTaskBarIcon;
        bool ConfigViewportsNoDecoration;
        bool ConfigViewportsNoDefaultParent;
        bool MouseDrawCursor;
        bool ConfigMacOSXBehaviors;
        bool ConfigInputTextCursorBlink;
        bool ConfigDragClickToInputText;
        bool ConfigWindowsResizeFromEdges;
        bool ConfigWindowsMoveFromTitleBarOnly;
        float ConfigMemoryCompactTimer;
        const(char)* BackendPlatformName;
        const(char)* BackendRendererName;
        void* BackendPlatformUserData;
        void* BackendRendererUserData;
        void* BackendLanguageUserData;
        const(char)* function(void*) GetClipboardTextFn;
        void function(void*, const(char)*) SetClipboardTextFn;
        void* ClipboardUserData;
        ImVec2 MousePos;
        bool[5] MouseDown;
        float MouseWheel;
        float MouseWheelH;
        uint MouseHoveredViewport;
        bool KeyCtrl;
        bool KeyShift;
        bool KeyAlt;
        bool KeySuper;
        bool[512] KeysDown;
        float[20] NavInputs;
        bool WantCaptureMouse;
        bool WantCaptureKeyboard;
        bool WantTextInput;
        bool WantSetMousePos;
        bool WantSaveIniSettings;
        bool NavActive;
        bool NavVisible;
        float Framerate;
        int MetricsRenderVertices;
        int MetricsRenderIndices;
        int MetricsRenderWindows;
        int MetricsActiveWindows;
        int MetricsActiveAllocations;
        ImVec2 MouseDelta;
        int KeyMods;
        int KeyModsPrev;
        ImVec2 MousePosPrev;
        ImVec2[5] MouseClickedPos;
        double[5] MouseClickedTime;
        bool[5] MouseClicked;
        bool[5] MouseDoubleClicked;
        bool[5] MouseReleased;
        bool[5] MouseDownOwned;
        bool[5] MouseDownWasDoubleClick;
        float[5] MouseDownDuration;
        float[5] MouseDownDurationPrev;
        ImVec2[5] MouseDragMaxDistanceAbs;
        float[5] MouseDragMaxDistanceSqr;
        float[512] KeysDownDuration;
        float[512] KeysDownDurationPrev;
        float[20] NavInputsDownDuration;
        float[20] NavInputsDownDurationPrev;
        float PenPressure;
        bool AppFocusLost;
        ushort InputQueueSurrogate;
        ImVector_ImWchar InputQueueCharacters;
    }
    struct ImGuiContext
    {
        bool Initialized;
        bool FontAtlasOwnedByContext;
        ImGuiIO IO;
        ImGuiPlatformIO PlatformIO;
        ImGuiStyle Style;
        int ConfigFlagsCurrFrame;
        int ConfigFlagsLastFrame;
        ImFont* Font;
        float FontSize;
        float FontBaseSize;
        ImDrawListSharedData DrawListSharedData;
        double Time;
        int FrameCount;
        int FrameCountEnded;
        int FrameCountPlatformEnded;
        int FrameCountRendered;
        bool WithinFrameScope;
        bool WithinFrameScopeWithImplicitWindow;
        bool WithinEndChild;
        bool GcCompactAll;
        bool TestEngineHookItems;
        uint TestEngineHookIdInfo;
        void* TestEngine;
        ImVector_ImGuiWindowPtr Windows;
        ImVector_ImGuiWindowPtr WindowsFocusOrder;
        ImVector_ImGuiWindowPtr WindowsTempSortBuffer;
        ImVector_ImGuiWindowStackData CurrentWindowStack;
        ImGuiStorage WindowsById;
        int WindowsActiveCount;
        ImVec2 WindowsHoverPadding;
        ImGuiWindow* CurrentWindow;
        ImGuiWindow* HoveredWindow;
        ImGuiWindow* HoveredWindowUnderMovingWindow;
        ImGuiDockNode* HoveredDockNode;
        ImGuiWindow* MovingWindow;
        ImGuiWindow* WheelingWindow;
        ImVec2 WheelingWindowRefMousePos;
        float WheelingWindowTimer;
        uint HoveredId;
        uint HoveredIdPreviousFrame;
        bool HoveredIdAllowOverlap;
        bool HoveredIdUsingMouseWheel;
        bool HoveredIdPreviousFrameUsingMouseWheel;
        bool HoveredIdDisabled;
        float HoveredIdTimer;
        float HoveredIdNotActiveTimer;
        uint ActiveId;
        uint ActiveIdIsAlive;
        float ActiveIdTimer;
        bool ActiveIdIsJustActivated;
        bool ActiveIdAllowOverlap;
        bool ActiveIdNoClearOnFocusLoss;
        bool ActiveIdHasBeenPressedBefore;
        bool ActiveIdHasBeenEditedBefore;
        bool ActiveIdHasBeenEditedThisFrame;
        bool ActiveIdUsingMouseWheel;
        uint ActiveIdUsingNavDirMask;
        uint ActiveIdUsingNavInputMask;
        ulong ActiveIdUsingKeyInputMask;
        ImVec2 ActiveIdClickOffset;
        ImGuiWindow* ActiveIdWindow;
        ImGuiInputSource ActiveIdSource;
        int ActiveIdMouseButton;
        uint ActiveIdPreviousFrame;
        bool ActiveIdPreviousFrameIsAlive;
        bool ActiveIdPreviousFrameHasBeenEditedBefore;
        ImGuiWindow* ActiveIdPreviousFrameWindow;
        uint LastActiveId;
        float LastActiveIdTimer;
        int CurrentItemFlags;
        ImGuiNextItemData NextItemData;
        ImGuiLastItemData LastItemData;
        ImGuiNextWindowData NextWindowData;
        ImVector_ImGuiColorMod ColorStack;
        ImVector_ImGuiStyleMod StyleVarStack;
        ImVector_ImFontPtr FontStack;
        ImVector_ImGuiID FocusScopeStack;
        ImVector_ImGuiItemFlags ItemFlagsStack;
        ImVector_ImGuiGroupData GroupStack;
        ImVector_ImGuiPopupData OpenPopupStack;
        ImVector_ImGuiPopupData BeginPopupStack;
        ImVector_ImGuiViewportPPtr Viewports;
        float CurrentDpiScale;
        ImGuiViewportP* CurrentViewport;
        ImGuiViewportP* MouseViewport;
        ImGuiViewportP* MouseLastHoveredViewport;
        uint PlatformLastFocusedViewportId;
        ImGuiPlatformMonitor FallbackMonitor;
        int ViewportFrontMostStampCount;
        ImGuiWindow* NavWindow;
        uint NavId;
        uint NavFocusScopeId;
        uint NavActivateId;
        uint NavActivateDownId;
        uint NavActivatePressedId;
        uint NavInputId;
        uint NavJustTabbedId;
        uint NavJustMovedToId;
        uint NavJustMovedToFocusScopeId;
        int NavJustMovedToKeyMods;
        uint NavNextActivateId;
        ImGuiInputSource NavInputSource;
        ImRect NavScoringRect;
        int NavScoringCount;
        ImGuiNavLayer NavLayer;
        int NavIdTabCounter;
        bool NavIdIsAlive;
        bool NavMousePosDirty;
        bool NavDisableHighlight;
        bool NavDisableMouseHover;
        bool NavAnyRequest;
        bool NavInitRequest;
        bool NavInitRequestFromMove;
        uint NavInitResultId;
        ImRect NavInitResultRectRel;
        bool NavMoveRequest;
        int NavMoveRequestFlags;
        ImGuiNavForward NavMoveRequestForward;
        int NavMoveRequestKeyMods;
        int NavMoveDir;
        int NavMoveDirLast;
        int NavMoveClipDir;
        ImGuiNavItemData NavMoveResultLocal;
        ImGuiNavItemData NavMoveResultLocalVisibleSet;
        ImGuiNavItemData NavMoveResultOther;
        ImGuiWindow* NavWrapRequestWindow;
        int NavWrapRequestFlags;
        ImGuiWindow* NavWindowingTarget;
        ImGuiWindow* NavWindowingTargetAnim;
        ImGuiWindow* NavWindowingListWindow;
        float NavWindowingTimer;
        float NavWindowingHighlightAlpha;
        bool NavWindowingToggleLayer;
        ImGuiWindow* TabFocusRequestCurrWindow;
        ImGuiWindow* TabFocusRequestNextWindow;
        int TabFocusRequestCurrCounterRegular;
        int TabFocusRequestCurrCounterTabStop;
        int TabFocusRequestNextCounterRegular;
        int TabFocusRequestNextCounterTabStop;
        bool TabFocusPressed;
        float DimBgRatio;
        int MouseCursor;
        bool DragDropActive;
        bool DragDropWithinSource;
        bool DragDropWithinTarget;
        int DragDropSourceFlags;
        int DragDropSourceFrameCount;
        int DragDropMouseButton;
        ImGuiPayload DragDropPayload;
        ImRect DragDropTargetRect;
        uint DragDropTargetId;
        int DragDropAcceptFlags;
        float DragDropAcceptIdCurrRectSurface;
        uint DragDropAcceptIdCurr;
        uint DragDropAcceptIdPrev;
        int DragDropAcceptFrameCount;
        uint DragDropHoldJustPressedId;
        ImVector_unsigned_char DragDropPayloadBufHeap;
        ubyte[16] DragDropPayloadBufLocal;
        ImGuiTable* CurrentTable;
        int CurrentTableStackIdx;
        ImPool_ImGuiTable Tables;
        ImVector_ImGuiTableTempData TablesTempDataStack;
        ImVector_float TablesLastTimeActive;
        ImVector_ImDrawChannel DrawChannelsTempMergeBuffer;
        ImGuiTabBar* CurrentTabBar;
        ImPool_ImGuiTabBar TabBars;
        ImVector_ImGuiPtrOrIndex CurrentTabBarStack;
        ImVector_ImGuiShrinkWidthItem ShrinkWidthBuffer;
        ImVec2 LastValidMousePos;
        ImGuiInputTextState InputTextState;
        ImFont InputTextPasswordFont;
        uint TempInputId;
        int ColorEditOptions;
        float ColorEditLastHue;
        float ColorEditLastSat;
        float[3] ColorEditLastColor;
        ImVec4 ColorPickerRef;
        ImGuiComboPreviewData ComboPreviewData;
        float SliderCurrentAccum;
        bool SliderCurrentAccumDirty;
        bool DragCurrentAccumDirty;
        float DragCurrentAccum;
        float DragSpeedDefaultRatio;
        float DisabledAlphaBackup;
        float ScrollbarClickDeltaToGrabCenter;
        int TooltipOverrideCount;
        float TooltipSlowDelay;
        ImVector_char ClipboardHandlerData;
        ImVector_ImGuiID MenusIdSubmittedThisFrame;
        ImVec2 PlatformImePos;
        ImVec2 PlatformImeLastPos;
        ImGuiViewportP* PlatformImePosViewport;
        char PlatformLocaleDecimalPoint;
        ImGuiDockContext DockContext;
        bool SettingsLoaded;
        float SettingsDirtyTimer;
        ImGuiTextBuffer SettingsIniData;
        ImVector_ImGuiSettingsHandler SettingsHandlers;
        ImChunkStream_ImGuiWindowSettings SettingsWindows;
        ImChunkStream_ImGuiTableSettings SettingsTables;
        ImVector_ImGuiContextHook Hooks;
        uint HookIdNext;
        bool LogEnabled;
        ImGuiLogType LogType;
        _iobuf* LogFile;
        ImGuiTextBuffer LogBuffer;
        const(char)* LogNextPrefix;
        const(char)* LogNextSuffix;
        float LogLinePosY;
        bool LogLineFirstItem;
        int LogDepthRef;
        int LogDepthToExpand;
        int LogDepthToExpandDefault;
        bool DebugItemPickerActive;
        uint DebugItemPickerBreakId;
        ImGuiMetricsConfig DebugMetricsConfig;
        float[120] FramerateSecPerFrame;
        int FramerateSecPerFrameIdx;
        int FramerateSecPerFrameCount;
        float FramerateSecPerFrameAccum;
        int WantCaptureMouseNextFrame;
        int WantCaptureKeyboardNextFrame;
        int WantTextInputNextFrame;
        char[3073] TempBuffer;
    }
    struct ImColor
    {
        ImVec4 Value;
    }
    struct ImFontGlyphRangesBuilder
    {
        ImVector_ImU32 UsedChars;
    }
    struct ImFontGlyph
    {
        import std.bitmanip: bitfields;

        align(4):
        mixin(bitfields!(
            uint, "Colored", 1,
            uint, "Visible", 1,
            uint, "Codepoint", 30,
        ));
        float AdvanceX;
        float X0;
        float Y0;
        float X1;
        float Y1;
        float U0;
        float V0;
        float U1;
        float V1;
    }
    struct ImFontConfig
    {
        void* FontData;
        int FontDataSize;
        bool FontDataOwnedByAtlas;
        int FontNo;
        float SizePixels;
        int OversampleH;
        int OversampleV;
        bool PixelSnapH;
        ImVec2 GlyphExtraSpacing;
        ImVec2 GlyphOffset;
        const(ushort)* GlyphRanges;
        float GlyphMinAdvanceX;
        float GlyphMaxAdvanceX;
        bool MergeMode;
        uint FontBuilderFlags;
        float RasterizerMultiply;
        ushort EllipsisChar;
        char[40] Name;
        ImFont* DstFont;
    }
    struct ImFontBuilderIO
    {
        bool function(ImFontAtlas*) FontBuilder_Build;
    }
    struct ImFontAtlas
    {
        int Flags;
        void* TexID;
        int TexDesiredWidth;
        int TexGlyphPadding;
        bool Locked;
        bool TexReady;
        bool TexPixelsUseColors;
        ubyte* TexPixelsAlpha8;
        uint* TexPixelsRGBA32;
        int TexWidth;
        int TexHeight;
        ImVec2 TexUvScale;
        ImVec2 TexUvWhitePixel;
        ImVector_ImFontPtr Fonts;
        ImVector_ImFontAtlasCustomRect CustomRects;
        ImVector_ImFontConfig ConfigData;
        ImVec4[64] TexUvLines;
        const(ImFontBuilderIO)* FontBuilderIO;
        uint FontBuilderFlags;
        int PackIdMouseCursors;
        int PackIdLines;
    }
    struct ImFont
    {
        ImVector_float IndexAdvanceX;
        float FallbackAdvanceX;
        float FontSize;
        ImVector_ImWchar IndexLookup;
        ImVector_ImFontGlyph Glyphs;
        const(ImFontGlyph)* FallbackGlyph;
        ImFontAtlas* ContainerAtlas;
        const(ImFontConfig)* ConfigData;
        short ConfigDataCount;
        ushort FallbackChar;
        ushort EllipsisChar;
        ushort DotChar;
        bool DirtyLookupTables;
        float Scale;
        float Ascent;
        float Descent;
        int MetricsTotalSurface;
        ubyte[2] Used4kPagesMap;
    }
    struct ImDrawVert
    {
        ImVec2 pos;
        ImVec2 uv;
        uint col;
    }
    struct ImDrawListSplitter
    {
        int _Current;
        int _Count;
        ImVector_ImDrawChannel _Channels;
    }
    struct ImDrawListSharedData
    {
        ImVec2 TexUvWhitePixel;
        ImFont* Font;
        float FontSize;
        float CurveTessellationTol;
        float CircleSegmentMaxError;
        ImVec4 ClipRectFullscreen;
        int InitialFlags;
        ImVec2[48] ArcFastVtx;
        float ArcFastRadiusCutoff;
        ubyte[64] CircleSegmentCounts;
        const(ImVec4)* TexUvLines;
    }
    struct ImDrawList
    {
        ImVector_ImDrawCmd CmdBuffer;
        ImVector_ImDrawIdx IdxBuffer;
        ImVector_ImDrawVert VtxBuffer;
        int Flags;
        uint _VtxCurrentIdx;
        const(ImDrawListSharedData)* _Data;
        const(char)* _OwnerName;
        ImDrawVert* _VtxWritePtr;
        ushort* _IdxWritePtr;
        ImVector_ImVec4 _ClipRectStack;
        ImVector_ImTextureID _TextureIdStack;
        ImVector_ImVec2 _Path;
        ImDrawCmdHeader _CmdHeader;
        ImDrawListSplitter _Splitter;
        float _FringeScale;
    }
    struct ImDrawData
    {
        bool Valid;
        int CmdListsCount;
        int TotalIdxCount;
        int TotalVtxCount;
        ImDrawList** CmdLists;
        ImVec2 DisplayPos;
        ImVec2 DisplaySize;
        ImVec2 FramebufferScale;
        ImGuiViewport* OwnerViewport;
    }
    struct ImDrawCmd
    {
        ImVec4 ClipRect;
        void* TextureId;
        uint VtxOffset;
        uint IdxOffset;
        uint ElemCount;
        void function(const(ImDrawList)*, const(ImDrawCmd)*) UserCallback;
        void* UserCallbackData;
    }
    struct ImDrawChannel
    {
        ImVector_ImDrawCmd _CmdBuffer;
        ImVector_ImDrawIdx _IdxBuffer;
    }
    alias ImGuiCol = int;
    alias ImGuiCond = int;
    alias ImGuiDataType = int;
    alias ImGuiDir = int;
    alias ImGuiKey = int;
    alias ImGuiNavInput = int;
    alias ImGuiMouseButton = int;
    alias ImGuiMouseCursor = int;
    alias ImGuiSortDirection = int;
    alias ImGuiStyleVar = int;
    alias ImGuiTableBgTarget = int;
    alias ImDrawFlags = int;
    alias ImDrawListFlags = int;
    alias ImFontAtlasFlags = int;
    alias ImGuiBackendFlags = int;
    alias ImGuiButtonFlags = int;
    alias ImGuiColorEditFlags = int;
    alias ImGuiConfigFlags = int;
    alias ImGuiComboFlags = int;
    alias ImGuiDockNodeFlags = int;
    alias ImGuiDragDropFlags = int;
    alias ImGuiFocusedFlags = int;
    alias ImGuiHoveredFlags = int;
    alias ImGuiInputTextFlags = int;
    alias ImGuiKeyModFlags = int;
    alias ImGuiPopupFlags = int;
    alias ImGuiSelectableFlags = int;
    alias ImGuiSliderFlags = int;
    alias ImGuiTabBarFlags = int;
    alias ImGuiTabItemFlags = int;
    alias ImGuiTableFlags = int;
    alias ImGuiTableColumnFlags = int;
    alias ImGuiTableRowFlags = int;
    alias ImGuiTreeNodeFlags = int;
    alias ImGuiViewportFlags = int;
    alias ImGuiWindowFlags = int;
    alias ImTextureID = void*;
    alias ImGuiID = uint;
    alias ImGuiInputTextCallback = int function(ImGuiInputTextCallbackData*);
    alias ImGuiSizeCallback = void function(ImGuiSizeCallbackData*);
    alias ImGuiMemAllocFunc = void* function(ulong, void*);
    alias ImGuiMemFreeFunc = void function(void*, void*);
    alias ImWchar16 = ushort;
    alias ImWchar32 = uint;
    alias ImWchar = ushort;
    alias ImS8 = byte;
    alias ImU8 = ubyte;
    alias ImS16 = short;
    alias ImU16 = ushort;
    alias ImS32 = int;
    alias ImU32 = uint;
    alias ImS64 = long;
    alias ImDrawCallback = void function(const(ImDrawList)*, const(ImDrawCmd)*);
    alias ImDrawIdx = ushort;
    alias ImGuiDataAuthority = int;
    alias ImGuiLayoutType = int;
    alias ImGuiItemFlags = int;
    alias ImGuiItemAddFlags = int;
    alias ImGuiItemStatusFlags = int;
    alias ImGuiOldColumnFlags = int;
    alias ImGuiNavHighlightFlags = int;
    alias ImGuiNavDirSourceFlags = int;
    alias ImGuiNavMoveFlags = int;
    alias ImGuiNextItemDataFlags = int;
    alias ImGuiNextWindowDataFlags = int;
    alias ImGuiSeparatorFlags = int;
    alias ImGuiTextFlags = int;
    alias ImGuiTooltipFlags = int;
    alias ImGuiErrorLogCallback = void function(void*, const(char)*);
    pragma(mangle, "?GImGui@@3PEAUImGuiContext@@EA") extern __gshared ImGuiContext* GImGui;
    alias ImFileHandle = _iobuf*;
    alias ImPoolIdx = int;
    alias ImGuiContextHookCallback = void function(ImGuiContext*, ImGuiContextHook*);
    alias ImGuiTableColumnIdx = byte;
    alias ImGuiTableDrawChannelIdx = ubyte;
    struct ImVector
    {
        int Size;
        int Capacity;
        void* Data;
    }
    struct ImVector_ImGuiTableSettings
    {
        int Size;
        int Capacity;
        ImGuiTableSettings* Data;
    }
    struct ImChunkStream_ImGuiTableSettings
    {
        ImVector_ImGuiTableSettings Buf;
    }
    struct ImVector_ImGuiWindowSettings
    {
        int Size;
        int Capacity;
        ImGuiWindowSettings* Data;
    }
    struct ImChunkStream_ImGuiWindowSettings
    {
        ImVector_ImGuiWindowSettings Buf;
    }
    struct ImSpan_ImGuiTableCellData
    {
        ImGuiTableCellData* Data;
        ImGuiTableCellData* DataEnd;
    }
    struct ImSpan_ImGuiTableColumn
    {
        ImGuiTableColumn* Data;
        ImGuiTableColumn* DataEnd;
    }
    struct ImSpan_ImGuiTableColumnIdx
    {
        byte* Data;
        byte* DataEnd;
    }
    struct ImVector_ImDrawChannel
    {
        int Size;
        int Capacity;
        ImDrawChannel* Data;
    }
    struct ImVector_ImDrawCmd
    {
        int Size;
        int Capacity;
        ImDrawCmd* Data;
    }
    struct ImVector_ImDrawIdx
    {
        int Size;
        int Capacity;
        ushort* Data;
    }
    struct ImVector_ImDrawListPtr
    {
        int Size;
        int Capacity;
        ImDrawList** Data;
    }
    struct ImVector_ImDrawVert
    {
        int Size;
        int Capacity;
        ImDrawVert* Data;
    }
    struct ImVector_ImFontPtr
    {
        int Size;
        int Capacity;
        ImFont** Data;
    }
    struct ImVector_ImFontAtlasCustomRect
    {
        int Size;
        int Capacity;
        ImFontAtlasCustomRect* Data;
    }
    struct ImVector_ImFontConfig
    {
        int Size;
        int Capacity;
        ImFontConfig* Data;
    }
    struct ImVector_ImFontGlyph
    {
        int Size;
        int Capacity;
        ImFontGlyph* Data;
    }
    struct ImVector_ImGuiColorMod
    {
        int Size;
        int Capacity;
        ImGuiColorMod* Data;
    }
    struct ImVector_ImGuiContextHook
    {
        int Size;
        int Capacity;
        ImGuiContextHook* Data;
    }
    struct ImVector_ImGuiDockNodeSettings
    {
        int Size;
        int Capacity;
        ImGuiDockNodeSettings* Data;
    }
    struct ImVector_ImGuiDockRequest
    {
        int Size;
        int Capacity;
        ImGuiDockRequest* Data;
    }
    struct ImVector_ImGuiGroupData
    {
        int Size;
        int Capacity;
        ImGuiGroupData* Data;
    }
    struct ImVector_ImGuiID
    {
        int Size;
        int Capacity;
        uint* Data;
    }
    struct ImVector_ImGuiItemFlags
    {
        int Size;
        int Capacity;
        int* Data;
    }
    struct ImVector_ImGuiOldColumnData
    {
        int Size;
        int Capacity;
        ImGuiOldColumnData* Data;
    }
    struct ImVector_ImGuiOldColumns
    {
        int Size;
        int Capacity;
        ImGuiOldColumns* Data;
    }
    struct ImVector_ImGuiPlatformMonitor
    {
        int Size;
        int Capacity;
        ImGuiPlatformMonitor* Data;
    }
    struct ImVector_ImGuiPopupData
    {
        int Size;
        int Capacity;
        ImGuiPopupData* Data;
    }
    struct ImVector_ImGuiPtrOrIndex
    {
        int Size;
        int Capacity;
        ImGuiPtrOrIndex* Data;
    }
    struct ImVector_ImGuiSettingsHandler
    {
        int Size;
        int Capacity;
        ImGuiSettingsHandler* Data;
    }
    struct ImVector_ImGuiShrinkWidthItem
    {
        int Size;
        int Capacity;
        ImGuiShrinkWidthItem* Data;
    }
    struct ImVector_ImGuiStoragePair
    {
        int Size;
        int Capacity;
        ImGuiStoragePair* Data;
    }
    struct ImVector_ImGuiStyleMod
    {
        int Size;
        int Capacity;
        ImGuiStyleMod* Data;
    }
    struct ImVector_ImGuiTabItem
    {
        int Size;
        int Capacity;
        ImGuiTabItem* Data;
    }
    struct ImVector_ImGuiTableColumnSortSpecs
    {
        int Size;
        int Capacity;
        ImGuiTableColumnSortSpecs* Data;
    }
    struct ImVector_ImGuiTableTempData
    {
        int Size;
        int Capacity;
        ImGuiTableTempData* Data;
    }
    struct ImVector_ImGuiTextRange
    {
        int Size;
        int Capacity;
        ImGuiTextRange* Data;
    }
    struct ImVector_ImGuiViewportPtr
    {
        int Size;
        int Capacity;
        ImGuiViewport** Data;
    }
    struct ImVector_ImGuiViewportPPtr
    {
        int Size;
        int Capacity;
        ImGuiViewportP** Data;
    }
    struct ImVector_ImGuiWindowPtr
    {
        int Size;
        int Capacity;
        ImGuiWindow** Data;
    }
    struct ImVector_ImGuiWindowStackData
    {
        int Size;
        int Capacity;
        ImGuiWindowStackData* Data;
    }
    struct ImVector_ImTextureID
    {
        int Size;
        int Capacity;
        void** Data;
    }
    struct ImVector_ImU32
    {
        int Size;
        int Capacity;
        uint* Data;
    }
    struct ImVector_ImVec2
    {
        int Size;
        int Capacity;
        ImVec2* Data;
    }
    struct ImVector_ImVec4
    {
        int Size;
        int Capacity;
        ImVec4* Data;
    }
    struct ImVector_ImWchar
    {
        int Size;
        int Capacity;
        ushort* Data;
    }
    struct ImVector_char
    {
        int Size;
        int Capacity;
        char* Data;
    }
    struct ImVector_const_charPtr
    {
        int Size;
        int Capacity;
        const(char)** Data;
    }
    struct ImVector_float
    {
        int Size;
        int Capacity;
        float* Data;
    }
    struct ImVector_unsigned_char
    {
        int Size;
        int Capacity;
        ubyte* Data;
    }
    alias ImGuiWindowFlags_ = _Anonymous_4;
    enum _Anonymous_4
    {
        ImGuiWindowFlags_None = 0,
        ImGuiWindowFlags_NoTitleBar = 1,
        ImGuiWindowFlags_NoResize = 2,
        ImGuiWindowFlags_NoMove = 4,
        ImGuiWindowFlags_NoScrollbar = 8,
        ImGuiWindowFlags_NoScrollWithMouse = 16,
        ImGuiWindowFlags_NoCollapse = 32,
        ImGuiWindowFlags_AlwaysAutoResize = 64,
        ImGuiWindowFlags_NoBackground = 128,
        ImGuiWindowFlags_NoSavedSettings = 256,
        ImGuiWindowFlags_NoMouseInputs = 512,
        ImGuiWindowFlags_MenuBar = 1024,
        ImGuiWindowFlags_HorizontalScrollbar = 2048,
        ImGuiWindowFlags_NoFocusOnAppearing = 4096,
        ImGuiWindowFlags_NoBringToFrontOnFocus = 8192,
        ImGuiWindowFlags_AlwaysVerticalScrollbar = 16384,
        ImGuiWindowFlags_AlwaysHorizontalScrollbar = 32768,
        ImGuiWindowFlags_AlwaysUseWindowPadding = 65536,
        ImGuiWindowFlags_NoNavInputs = 262144,
        ImGuiWindowFlags_NoNavFocus = 524288,
        ImGuiWindowFlags_UnsavedDocument = 1048576,
        ImGuiWindowFlags_NoDocking = 2097152,
        ImGuiWindowFlags_NoNav = 786432,
        ImGuiWindowFlags_NoDecoration = 43,
        ImGuiWindowFlags_NoInputs = 786944,
        ImGuiWindowFlags_NavFlattened = 8388608,
        ImGuiWindowFlags_ChildWindow = 16777216,
        ImGuiWindowFlags_Tooltip = 33554432,
        ImGuiWindowFlags_Popup = 67108864,
        ImGuiWindowFlags_Modal = 134217728,
        ImGuiWindowFlags_ChildMenu = 268435456,
        ImGuiWindowFlags_DockNodeHost = 536870912,
    }
    enum ImGuiWindowFlags_None = _Anonymous_4.ImGuiWindowFlags_None;
    enum ImGuiWindowFlags_NoTitleBar = _Anonymous_4.ImGuiWindowFlags_NoTitleBar;
    enum ImGuiWindowFlags_NoResize = _Anonymous_4.ImGuiWindowFlags_NoResize;
    enum ImGuiWindowFlags_NoMove = _Anonymous_4.ImGuiWindowFlags_NoMove;
    enum ImGuiWindowFlags_NoScrollbar = _Anonymous_4.ImGuiWindowFlags_NoScrollbar;
    enum ImGuiWindowFlags_NoScrollWithMouse = _Anonymous_4.ImGuiWindowFlags_NoScrollWithMouse;
    enum ImGuiWindowFlags_NoCollapse = _Anonymous_4.ImGuiWindowFlags_NoCollapse;
    enum ImGuiWindowFlags_AlwaysAutoResize = _Anonymous_4.ImGuiWindowFlags_AlwaysAutoResize;
    enum ImGuiWindowFlags_NoBackground = _Anonymous_4.ImGuiWindowFlags_NoBackground;
    enum ImGuiWindowFlags_NoSavedSettings = _Anonymous_4.ImGuiWindowFlags_NoSavedSettings;
    enum ImGuiWindowFlags_NoMouseInputs = _Anonymous_4.ImGuiWindowFlags_NoMouseInputs;
    enum ImGuiWindowFlags_MenuBar = _Anonymous_4.ImGuiWindowFlags_MenuBar;
    enum ImGuiWindowFlags_HorizontalScrollbar = _Anonymous_4.ImGuiWindowFlags_HorizontalScrollbar;
    enum ImGuiWindowFlags_NoFocusOnAppearing = _Anonymous_4.ImGuiWindowFlags_NoFocusOnAppearing;
    enum ImGuiWindowFlags_NoBringToFrontOnFocus = _Anonymous_4.ImGuiWindowFlags_NoBringToFrontOnFocus;
    enum ImGuiWindowFlags_AlwaysVerticalScrollbar = _Anonymous_4.ImGuiWindowFlags_AlwaysVerticalScrollbar;
    enum ImGuiWindowFlags_AlwaysHorizontalScrollbar = _Anonymous_4.ImGuiWindowFlags_AlwaysHorizontalScrollbar;
    enum ImGuiWindowFlags_AlwaysUseWindowPadding = _Anonymous_4.ImGuiWindowFlags_AlwaysUseWindowPadding;
    enum ImGuiWindowFlags_NoNavInputs = _Anonymous_4.ImGuiWindowFlags_NoNavInputs;
    enum ImGuiWindowFlags_NoNavFocus = _Anonymous_4.ImGuiWindowFlags_NoNavFocus;
    enum ImGuiWindowFlags_UnsavedDocument = _Anonymous_4.ImGuiWindowFlags_UnsavedDocument;
    enum ImGuiWindowFlags_NoDocking = _Anonymous_4.ImGuiWindowFlags_NoDocking;
    enum ImGuiWindowFlags_NoNav = _Anonymous_4.ImGuiWindowFlags_NoNav;
    enum ImGuiWindowFlags_NoDecoration = _Anonymous_4.ImGuiWindowFlags_NoDecoration;
    enum ImGuiWindowFlags_NoInputs = _Anonymous_4.ImGuiWindowFlags_NoInputs;
    enum ImGuiWindowFlags_NavFlattened = _Anonymous_4.ImGuiWindowFlags_NavFlattened;
    enum ImGuiWindowFlags_ChildWindow = _Anonymous_4.ImGuiWindowFlags_ChildWindow;
    enum ImGuiWindowFlags_Tooltip = _Anonymous_4.ImGuiWindowFlags_Tooltip;
    enum ImGuiWindowFlags_Popup = _Anonymous_4.ImGuiWindowFlags_Popup;
    enum ImGuiWindowFlags_Modal = _Anonymous_4.ImGuiWindowFlags_Modal;
    enum ImGuiWindowFlags_ChildMenu = _Anonymous_4.ImGuiWindowFlags_ChildMenu;
    enum ImGuiWindowFlags_DockNodeHost = _Anonymous_4.ImGuiWindowFlags_DockNodeHost;
    alias ImGuiInputTextFlags_ = _Anonymous_5;
    enum _Anonymous_5
    {
        ImGuiInputTextFlags_None = 0,
        ImGuiInputTextFlags_CharsDecimal = 1,
        ImGuiInputTextFlags_CharsHexadecimal = 2,
        ImGuiInputTextFlags_CharsUppercase = 4,
        ImGuiInputTextFlags_CharsNoBlank = 8,
        ImGuiInputTextFlags_AutoSelectAll = 16,
        ImGuiInputTextFlags_EnterReturnsTrue = 32,
        ImGuiInputTextFlags_CallbackCompletion = 64,
        ImGuiInputTextFlags_CallbackHistory = 128,
        ImGuiInputTextFlags_CallbackAlways = 256,
        ImGuiInputTextFlags_CallbackCharFilter = 512,
        ImGuiInputTextFlags_AllowTabInput = 1024,
        ImGuiInputTextFlags_CtrlEnterForNewLine = 2048,
        ImGuiInputTextFlags_NoHorizontalScroll = 4096,
        ImGuiInputTextFlags_AlwaysOverwrite = 8192,
        ImGuiInputTextFlags_ReadOnly = 16384,
        ImGuiInputTextFlags_Password = 32768,
        ImGuiInputTextFlags_NoUndoRedo = 65536,
        ImGuiInputTextFlags_CharsScientific = 131072,
        ImGuiInputTextFlags_CallbackResize = 262144,
        ImGuiInputTextFlags_CallbackEdit = 524288,
    }
    enum ImGuiInputTextFlags_None = _Anonymous_5.ImGuiInputTextFlags_None;
    enum ImGuiInputTextFlags_CharsDecimal = _Anonymous_5.ImGuiInputTextFlags_CharsDecimal;
    enum ImGuiInputTextFlags_CharsHexadecimal = _Anonymous_5.ImGuiInputTextFlags_CharsHexadecimal;
    enum ImGuiInputTextFlags_CharsUppercase = _Anonymous_5.ImGuiInputTextFlags_CharsUppercase;
    enum ImGuiInputTextFlags_CharsNoBlank = _Anonymous_5.ImGuiInputTextFlags_CharsNoBlank;
    enum ImGuiInputTextFlags_AutoSelectAll = _Anonymous_5.ImGuiInputTextFlags_AutoSelectAll;
    enum ImGuiInputTextFlags_EnterReturnsTrue = _Anonymous_5.ImGuiInputTextFlags_EnterReturnsTrue;
    enum ImGuiInputTextFlags_CallbackCompletion = _Anonymous_5.ImGuiInputTextFlags_CallbackCompletion;
    enum ImGuiInputTextFlags_CallbackHistory = _Anonymous_5.ImGuiInputTextFlags_CallbackHistory;
    enum ImGuiInputTextFlags_CallbackAlways = _Anonymous_5.ImGuiInputTextFlags_CallbackAlways;
    enum ImGuiInputTextFlags_CallbackCharFilter = _Anonymous_5.ImGuiInputTextFlags_CallbackCharFilter;
    enum ImGuiInputTextFlags_AllowTabInput = _Anonymous_5.ImGuiInputTextFlags_AllowTabInput;
    enum ImGuiInputTextFlags_CtrlEnterForNewLine = _Anonymous_5.ImGuiInputTextFlags_CtrlEnterForNewLine;
    enum ImGuiInputTextFlags_NoHorizontalScroll = _Anonymous_5.ImGuiInputTextFlags_NoHorizontalScroll;
    enum ImGuiInputTextFlags_AlwaysOverwrite = _Anonymous_5.ImGuiInputTextFlags_AlwaysOverwrite;
    enum ImGuiInputTextFlags_ReadOnly = _Anonymous_5.ImGuiInputTextFlags_ReadOnly;
    enum ImGuiInputTextFlags_Password = _Anonymous_5.ImGuiInputTextFlags_Password;
    enum ImGuiInputTextFlags_NoUndoRedo = _Anonymous_5.ImGuiInputTextFlags_NoUndoRedo;
    enum ImGuiInputTextFlags_CharsScientific = _Anonymous_5.ImGuiInputTextFlags_CharsScientific;
    enum ImGuiInputTextFlags_CallbackResize = _Anonymous_5.ImGuiInputTextFlags_CallbackResize;
    enum ImGuiInputTextFlags_CallbackEdit = _Anonymous_5.ImGuiInputTextFlags_CallbackEdit;
    alias ImGuiTreeNodeFlags_ = _Anonymous_6;
    enum _Anonymous_6
    {
        ImGuiTreeNodeFlags_None = 0,
        ImGuiTreeNodeFlags_Selected = 1,
        ImGuiTreeNodeFlags_Framed = 2,
        ImGuiTreeNodeFlags_AllowItemOverlap = 4,
        ImGuiTreeNodeFlags_NoTreePushOnOpen = 8,
        ImGuiTreeNodeFlags_NoAutoOpenOnLog = 16,
        ImGuiTreeNodeFlags_DefaultOpen = 32,
        ImGuiTreeNodeFlags_OpenOnDoubleClick = 64,
        ImGuiTreeNodeFlags_OpenOnArrow = 128,
        ImGuiTreeNodeFlags_Leaf = 256,
        ImGuiTreeNodeFlags_Bullet = 512,
        ImGuiTreeNodeFlags_FramePadding = 1024,
        ImGuiTreeNodeFlags_SpanAvailWidth = 2048,
        ImGuiTreeNodeFlags_SpanFullWidth = 4096,
        ImGuiTreeNodeFlags_NavLeftJumpsBackHere = 8192,
        ImGuiTreeNodeFlags_CollapsingHeader = 26,
    }
    enum ImGuiTreeNodeFlags_None = _Anonymous_6.ImGuiTreeNodeFlags_None;
    enum ImGuiTreeNodeFlags_Selected = _Anonymous_6.ImGuiTreeNodeFlags_Selected;
    enum ImGuiTreeNodeFlags_Framed = _Anonymous_6.ImGuiTreeNodeFlags_Framed;
    enum ImGuiTreeNodeFlags_AllowItemOverlap = _Anonymous_6.ImGuiTreeNodeFlags_AllowItemOverlap;
    enum ImGuiTreeNodeFlags_NoTreePushOnOpen = _Anonymous_6.ImGuiTreeNodeFlags_NoTreePushOnOpen;
    enum ImGuiTreeNodeFlags_NoAutoOpenOnLog = _Anonymous_6.ImGuiTreeNodeFlags_NoAutoOpenOnLog;
    enum ImGuiTreeNodeFlags_DefaultOpen = _Anonymous_6.ImGuiTreeNodeFlags_DefaultOpen;
    enum ImGuiTreeNodeFlags_OpenOnDoubleClick = _Anonymous_6.ImGuiTreeNodeFlags_OpenOnDoubleClick;
    enum ImGuiTreeNodeFlags_OpenOnArrow = _Anonymous_6.ImGuiTreeNodeFlags_OpenOnArrow;
    enum ImGuiTreeNodeFlags_Leaf = _Anonymous_6.ImGuiTreeNodeFlags_Leaf;
    enum ImGuiTreeNodeFlags_Bullet = _Anonymous_6.ImGuiTreeNodeFlags_Bullet;
    enum ImGuiTreeNodeFlags_FramePadding = _Anonymous_6.ImGuiTreeNodeFlags_FramePadding;
    enum ImGuiTreeNodeFlags_SpanAvailWidth = _Anonymous_6.ImGuiTreeNodeFlags_SpanAvailWidth;
    enum ImGuiTreeNodeFlags_SpanFullWidth = _Anonymous_6.ImGuiTreeNodeFlags_SpanFullWidth;
    enum ImGuiTreeNodeFlags_NavLeftJumpsBackHere = _Anonymous_6.ImGuiTreeNodeFlags_NavLeftJumpsBackHere;
    enum ImGuiTreeNodeFlags_CollapsingHeader = _Anonymous_6.ImGuiTreeNodeFlags_CollapsingHeader;
    alias ImGuiPopupFlags_ = _Anonymous_7;
    enum _Anonymous_7
    {
        ImGuiPopupFlags_None = 0,
        ImGuiPopupFlags_MouseButtonLeft = 0,
        ImGuiPopupFlags_MouseButtonRight = 1,
        ImGuiPopupFlags_MouseButtonMiddle = 2,
        ImGuiPopupFlags_MouseButtonMask_ = 31,
        ImGuiPopupFlags_MouseButtonDefault_ = 1,
        ImGuiPopupFlags_NoOpenOverExistingPopup = 32,
        ImGuiPopupFlags_NoOpenOverItems = 64,
        ImGuiPopupFlags_AnyPopupId = 128,
        ImGuiPopupFlags_AnyPopupLevel = 256,
        ImGuiPopupFlags_AnyPopup = 384,
    }
    enum ImGuiPopupFlags_None = _Anonymous_7.ImGuiPopupFlags_None;
    enum ImGuiPopupFlags_MouseButtonLeft = _Anonymous_7.ImGuiPopupFlags_MouseButtonLeft;
    enum ImGuiPopupFlags_MouseButtonRight = _Anonymous_7.ImGuiPopupFlags_MouseButtonRight;
    enum ImGuiPopupFlags_MouseButtonMiddle = _Anonymous_7.ImGuiPopupFlags_MouseButtonMiddle;
    enum ImGuiPopupFlags_MouseButtonMask_ = _Anonymous_7.ImGuiPopupFlags_MouseButtonMask_;
    enum ImGuiPopupFlags_MouseButtonDefault_ = _Anonymous_7.ImGuiPopupFlags_MouseButtonDefault_;
    enum ImGuiPopupFlags_NoOpenOverExistingPopup = _Anonymous_7.ImGuiPopupFlags_NoOpenOverExistingPopup;
    enum ImGuiPopupFlags_NoOpenOverItems = _Anonymous_7.ImGuiPopupFlags_NoOpenOverItems;
    enum ImGuiPopupFlags_AnyPopupId = _Anonymous_7.ImGuiPopupFlags_AnyPopupId;
    enum ImGuiPopupFlags_AnyPopupLevel = _Anonymous_7.ImGuiPopupFlags_AnyPopupLevel;
    enum ImGuiPopupFlags_AnyPopup = _Anonymous_7.ImGuiPopupFlags_AnyPopup;
    alias ImGuiSelectableFlags_ = _Anonymous_8;
    enum _Anonymous_8
    {
        ImGuiSelectableFlags_None = 0,
        ImGuiSelectableFlags_DontClosePopups = 1,
        ImGuiSelectableFlags_SpanAllColumns = 2,
        ImGuiSelectableFlags_AllowDoubleClick = 4,
        ImGuiSelectableFlags_Disabled = 8,
        ImGuiSelectableFlags_AllowItemOverlap = 16,
    }
    enum ImGuiSelectableFlags_None = _Anonymous_8.ImGuiSelectableFlags_None;
    enum ImGuiSelectableFlags_DontClosePopups = _Anonymous_8.ImGuiSelectableFlags_DontClosePopups;
    enum ImGuiSelectableFlags_SpanAllColumns = _Anonymous_8.ImGuiSelectableFlags_SpanAllColumns;
    enum ImGuiSelectableFlags_AllowDoubleClick = _Anonymous_8.ImGuiSelectableFlags_AllowDoubleClick;
    enum ImGuiSelectableFlags_Disabled = _Anonymous_8.ImGuiSelectableFlags_Disabled;
    enum ImGuiSelectableFlags_AllowItemOverlap = _Anonymous_8.ImGuiSelectableFlags_AllowItemOverlap;
    alias ImGuiComboFlags_ = _Anonymous_9;
    enum _Anonymous_9
    {
        ImGuiComboFlags_None = 0,
        ImGuiComboFlags_PopupAlignLeft = 1,
        ImGuiComboFlags_HeightSmall = 2,
        ImGuiComboFlags_HeightRegular = 4,
        ImGuiComboFlags_HeightLarge = 8,
        ImGuiComboFlags_HeightLargest = 16,
        ImGuiComboFlags_NoArrowButton = 32,
        ImGuiComboFlags_NoPreview = 64,
        ImGuiComboFlags_HeightMask_ = 30,
    }
    enum ImGuiComboFlags_None = _Anonymous_9.ImGuiComboFlags_None;
    enum ImGuiComboFlags_PopupAlignLeft = _Anonymous_9.ImGuiComboFlags_PopupAlignLeft;
    enum ImGuiComboFlags_HeightSmall = _Anonymous_9.ImGuiComboFlags_HeightSmall;
    enum ImGuiComboFlags_HeightRegular = _Anonymous_9.ImGuiComboFlags_HeightRegular;
    enum ImGuiComboFlags_HeightLarge = _Anonymous_9.ImGuiComboFlags_HeightLarge;
    enum ImGuiComboFlags_HeightLargest = _Anonymous_9.ImGuiComboFlags_HeightLargest;
    enum ImGuiComboFlags_NoArrowButton = _Anonymous_9.ImGuiComboFlags_NoArrowButton;
    enum ImGuiComboFlags_NoPreview = _Anonymous_9.ImGuiComboFlags_NoPreview;
    enum ImGuiComboFlags_HeightMask_ = _Anonymous_9.ImGuiComboFlags_HeightMask_;
    alias ImGuiTabBarFlags_ = _Anonymous_10;
    enum _Anonymous_10
    {
        ImGuiTabBarFlags_None = 0,
        ImGuiTabBarFlags_Reorderable = 1,
        ImGuiTabBarFlags_AutoSelectNewTabs = 2,
        ImGuiTabBarFlags_TabListPopupButton = 4,
        ImGuiTabBarFlags_NoCloseWithMiddleMouseButton = 8,
        ImGuiTabBarFlags_NoTabListScrollingButtons = 16,
        ImGuiTabBarFlags_NoTooltip = 32,
        ImGuiTabBarFlags_FittingPolicyResizeDown = 64,
        ImGuiTabBarFlags_FittingPolicyScroll = 128,
        ImGuiTabBarFlags_FittingPolicyMask_ = 192,
        ImGuiTabBarFlags_FittingPolicyDefault_ = 64,
    }
    enum ImGuiTabBarFlags_None = _Anonymous_10.ImGuiTabBarFlags_None;
    enum ImGuiTabBarFlags_Reorderable = _Anonymous_10.ImGuiTabBarFlags_Reorderable;
    enum ImGuiTabBarFlags_AutoSelectNewTabs = _Anonymous_10.ImGuiTabBarFlags_AutoSelectNewTabs;
    enum ImGuiTabBarFlags_TabListPopupButton = _Anonymous_10.ImGuiTabBarFlags_TabListPopupButton;
    enum ImGuiTabBarFlags_NoCloseWithMiddleMouseButton = _Anonymous_10.ImGuiTabBarFlags_NoCloseWithMiddleMouseButton;
    enum ImGuiTabBarFlags_NoTabListScrollingButtons = _Anonymous_10.ImGuiTabBarFlags_NoTabListScrollingButtons;
    enum ImGuiTabBarFlags_NoTooltip = _Anonymous_10.ImGuiTabBarFlags_NoTooltip;
    enum ImGuiTabBarFlags_FittingPolicyResizeDown = _Anonymous_10.ImGuiTabBarFlags_FittingPolicyResizeDown;
    enum ImGuiTabBarFlags_FittingPolicyScroll = _Anonymous_10.ImGuiTabBarFlags_FittingPolicyScroll;
    enum ImGuiTabBarFlags_FittingPolicyMask_ = _Anonymous_10.ImGuiTabBarFlags_FittingPolicyMask_;
    enum ImGuiTabBarFlags_FittingPolicyDefault_ = _Anonymous_10.ImGuiTabBarFlags_FittingPolicyDefault_;
    alias ImGuiTabItemFlags_ = _Anonymous_11;
    enum _Anonymous_11
    {
        ImGuiTabItemFlags_None = 0,
        ImGuiTabItemFlags_UnsavedDocument = 1,
        ImGuiTabItemFlags_SetSelected = 2,
        ImGuiTabItemFlags_NoCloseWithMiddleMouseButton = 4,
        ImGuiTabItemFlags_NoPushId = 8,
        ImGuiTabItemFlags_NoTooltip = 16,
        ImGuiTabItemFlags_NoReorder = 32,
        ImGuiTabItemFlags_Leading = 64,
        ImGuiTabItemFlags_Trailing = 128,
    }
    enum ImGuiTabItemFlags_None = _Anonymous_11.ImGuiTabItemFlags_None;
    enum ImGuiTabItemFlags_UnsavedDocument = _Anonymous_11.ImGuiTabItemFlags_UnsavedDocument;
    enum ImGuiTabItemFlags_SetSelected = _Anonymous_11.ImGuiTabItemFlags_SetSelected;
    enum ImGuiTabItemFlags_NoCloseWithMiddleMouseButton = _Anonymous_11.ImGuiTabItemFlags_NoCloseWithMiddleMouseButton;
    enum ImGuiTabItemFlags_NoPushId = _Anonymous_11.ImGuiTabItemFlags_NoPushId;
    enum ImGuiTabItemFlags_NoTooltip = _Anonymous_11.ImGuiTabItemFlags_NoTooltip;
    enum ImGuiTabItemFlags_NoReorder = _Anonymous_11.ImGuiTabItemFlags_NoReorder;
    enum ImGuiTabItemFlags_Leading = _Anonymous_11.ImGuiTabItemFlags_Leading;
    enum ImGuiTabItemFlags_Trailing = _Anonymous_11.ImGuiTabItemFlags_Trailing;
    alias ImGuiTableFlags_ = _Anonymous_12;
    enum _Anonymous_12
    {
        ImGuiTableFlags_None = 0,
        ImGuiTableFlags_Resizable = 1,
        ImGuiTableFlags_Reorderable = 2,
        ImGuiTableFlags_Hideable = 4,
        ImGuiTableFlags_Sortable = 8,
        ImGuiTableFlags_NoSavedSettings = 16,
        ImGuiTableFlags_ContextMenuInBody = 32,
        ImGuiTableFlags_RowBg = 64,
        ImGuiTableFlags_BordersInnerH = 128,
        ImGuiTableFlags_BordersOuterH = 256,
        ImGuiTableFlags_BordersInnerV = 512,
        ImGuiTableFlags_BordersOuterV = 1024,
        ImGuiTableFlags_BordersH = 384,
        ImGuiTableFlags_BordersV = 1536,
        ImGuiTableFlags_BordersInner = 640,
        ImGuiTableFlags_BordersOuter = 1280,
        ImGuiTableFlags_Borders = 1920,
        ImGuiTableFlags_NoBordersInBody = 2048,
        ImGuiTableFlags_NoBordersInBodyUntilResize = 4096,
        ImGuiTableFlags_SizingFixedFit = 8192,
        ImGuiTableFlags_SizingFixedSame = 16384,
        ImGuiTableFlags_SizingStretchProp = 24576,
        ImGuiTableFlags_SizingStretchSame = 32768,
        ImGuiTableFlags_NoHostExtendX = 65536,
        ImGuiTableFlags_NoHostExtendY = 131072,
        ImGuiTableFlags_NoKeepColumnsVisible = 262144,
        ImGuiTableFlags_PreciseWidths = 524288,
        ImGuiTableFlags_NoClip = 1048576,
        ImGuiTableFlags_PadOuterX = 2097152,
        ImGuiTableFlags_NoPadOuterX = 4194304,
        ImGuiTableFlags_NoPadInnerX = 8388608,
        ImGuiTableFlags_ScrollX = 16777216,
        ImGuiTableFlags_ScrollY = 33554432,
        ImGuiTableFlags_SortMulti = 67108864,
        ImGuiTableFlags_SortTristate = 134217728,
        ImGuiTableFlags_SizingMask_ = 57344,
    }
    enum ImGuiTableFlags_None = _Anonymous_12.ImGuiTableFlags_None;
    enum ImGuiTableFlags_Resizable = _Anonymous_12.ImGuiTableFlags_Resizable;
    enum ImGuiTableFlags_Reorderable = _Anonymous_12.ImGuiTableFlags_Reorderable;
    enum ImGuiTableFlags_Hideable = _Anonymous_12.ImGuiTableFlags_Hideable;
    enum ImGuiTableFlags_Sortable = _Anonymous_12.ImGuiTableFlags_Sortable;
    enum ImGuiTableFlags_NoSavedSettings = _Anonymous_12.ImGuiTableFlags_NoSavedSettings;
    enum ImGuiTableFlags_ContextMenuInBody = _Anonymous_12.ImGuiTableFlags_ContextMenuInBody;
    enum ImGuiTableFlags_RowBg = _Anonymous_12.ImGuiTableFlags_RowBg;
    enum ImGuiTableFlags_BordersInnerH = _Anonymous_12.ImGuiTableFlags_BordersInnerH;
    enum ImGuiTableFlags_BordersOuterH = _Anonymous_12.ImGuiTableFlags_BordersOuterH;
    enum ImGuiTableFlags_BordersInnerV = _Anonymous_12.ImGuiTableFlags_BordersInnerV;
    enum ImGuiTableFlags_BordersOuterV = _Anonymous_12.ImGuiTableFlags_BordersOuterV;
    enum ImGuiTableFlags_BordersH = _Anonymous_12.ImGuiTableFlags_BordersH;
    enum ImGuiTableFlags_BordersV = _Anonymous_12.ImGuiTableFlags_BordersV;
    enum ImGuiTableFlags_BordersInner = _Anonymous_12.ImGuiTableFlags_BordersInner;
    enum ImGuiTableFlags_BordersOuter = _Anonymous_12.ImGuiTableFlags_BordersOuter;
    enum ImGuiTableFlags_Borders = _Anonymous_12.ImGuiTableFlags_Borders;
    enum ImGuiTableFlags_NoBordersInBody = _Anonymous_12.ImGuiTableFlags_NoBordersInBody;
    enum ImGuiTableFlags_NoBordersInBodyUntilResize = _Anonymous_12.ImGuiTableFlags_NoBordersInBodyUntilResize;
    enum ImGuiTableFlags_SizingFixedFit = _Anonymous_12.ImGuiTableFlags_SizingFixedFit;
    enum ImGuiTableFlags_SizingFixedSame = _Anonymous_12.ImGuiTableFlags_SizingFixedSame;
    enum ImGuiTableFlags_SizingStretchProp = _Anonymous_12.ImGuiTableFlags_SizingStretchProp;
    enum ImGuiTableFlags_SizingStretchSame = _Anonymous_12.ImGuiTableFlags_SizingStretchSame;
    enum ImGuiTableFlags_NoHostExtendX = _Anonymous_12.ImGuiTableFlags_NoHostExtendX;
    enum ImGuiTableFlags_NoHostExtendY = _Anonymous_12.ImGuiTableFlags_NoHostExtendY;
    enum ImGuiTableFlags_NoKeepColumnsVisible = _Anonymous_12.ImGuiTableFlags_NoKeepColumnsVisible;
    enum ImGuiTableFlags_PreciseWidths = _Anonymous_12.ImGuiTableFlags_PreciseWidths;
    enum ImGuiTableFlags_NoClip = _Anonymous_12.ImGuiTableFlags_NoClip;
    enum ImGuiTableFlags_PadOuterX = _Anonymous_12.ImGuiTableFlags_PadOuterX;
    enum ImGuiTableFlags_NoPadOuterX = _Anonymous_12.ImGuiTableFlags_NoPadOuterX;
    enum ImGuiTableFlags_NoPadInnerX = _Anonymous_12.ImGuiTableFlags_NoPadInnerX;
    enum ImGuiTableFlags_ScrollX = _Anonymous_12.ImGuiTableFlags_ScrollX;
    enum ImGuiTableFlags_ScrollY = _Anonymous_12.ImGuiTableFlags_ScrollY;
    enum ImGuiTableFlags_SortMulti = _Anonymous_12.ImGuiTableFlags_SortMulti;
    enum ImGuiTableFlags_SortTristate = _Anonymous_12.ImGuiTableFlags_SortTristate;
    enum ImGuiTableFlags_SizingMask_ = _Anonymous_12.ImGuiTableFlags_SizingMask_;
    alias ImGuiTableColumnFlags_ = _Anonymous_13;
    enum _Anonymous_13
    {
        ImGuiTableColumnFlags_None = 0,
        ImGuiTableColumnFlags_Disabled = 1,
        ImGuiTableColumnFlags_DefaultHide = 2,
        ImGuiTableColumnFlags_DefaultSort = 4,
        ImGuiTableColumnFlags_WidthStretch = 8,
        ImGuiTableColumnFlags_WidthFixed = 16,
        ImGuiTableColumnFlags_NoResize = 32,
        ImGuiTableColumnFlags_NoReorder = 64,
        ImGuiTableColumnFlags_NoHide = 128,
        ImGuiTableColumnFlags_NoClip = 256,
        ImGuiTableColumnFlags_NoSort = 512,
        ImGuiTableColumnFlags_NoSortAscending = 1024,
        ImGuiTableColumnFlags_NoSortDescending = 2048,
        ImGuiTableColumnFlags_NoHeaderLabel = 4096,
        ImGuiTableColumnFlags_NoHeaderWidth = 8192,
        ImGuiTableColumnFlags_PreferSortAscending = 16384,
        ImGuiTableColumnFlags_PreferSortDescending = 32768,
        ImGuiTableColumnFlags_IndentEnable = 65536,
        ImGuiTableColumnFlags_IndentDisable = 131072,
        ImGuiTableColumnFlags_IsEnabled = 16777216,
        ImGuiTableColumnFlags_IsVisible = 33554432,
        ImGuiTableColumnFlags_IsSorted = 67108864,
        ImGuiTableColumnFlags_IsHovered = 134217728,
        ImGuiTableColumnFlags_WidthMask_ = 24,
        ImGuiTableColumnFlags_IndentMask_ = 196608,
        ImGuiTableColumnFlags_StatusMask_ = 251658240,
        ImGuiTableColumnFlags_NoDirectResize_ = 1073741824,
    }
    enum ImGuiTableColumnFlags_None = _Anonymous_13.ImGuiTableColumnFlags_None;
    enum ImGuiTableColumnFlags_Disabled = _Anonymous_13.ImGuiTableColumnFlags_Disabled;
    enum ImGuiTableColumnFlags_DefaultHide = _Anonymous_13.ImGuiTableColumnFlags_DefaultHide;
    enum ImGuiTableColumnFlags_DefaultSort = _Anonymous_13.ImGuiTableColumnFlags_DefaultSort;
    enum ImGuiTableColumnFlags_WidthStretch = _Anonymous_13.ImGuiTableColumnFlags_WidthStretch;
    enum ImGuiTableColumnFlags_WidthFixed = _Anonymous_13.ImGuiTableColumnFlags_WidthFixed;
    enum ImGuiTableColumnFlags_NoResize = _Anonymous_13.ImGuiTableColumnFlags_NoResize;
    enum ImGuiTableColumnFlags_NoReorder = _Anonymous_13.ImGuiTableColumnFlags_NoReorder;
    enum ImGuiTableColumnFlags_NoHide = _Anonymous_13.ImGuiTableColumnFlags_NoHide;
    enum ImGuiTableColumnFlags_NoClip = _Anonymous_13.ImGuiTableColumnFlags_NoClip;
    enum ImGuiTableColumnFlags_NoSort = _Anonymous_13.ImGuiTableColumnFlags_NoSort;
    enum ImGuiTableColumnFlags_NoSortAscending = _Anonymous_13.ImGuiTableColumnFlags_NoSortAscending;
    enum ImGuiTableColumnFlags_NoSortDescending = _Anonymous_13.ImGuiTableColumnFlags_NoSortDescending;
    enum ImGuiTableColumnFlags_NoHeaderLabel = _Anonymous_13.ImGuiTableColumnFlags_NoHeaderLabel;
    enum ImGuiTableColumnFlags_NoHeaderWidth = _Anonymous_13.ImGuiTableColumnFlags_NoHeaderWidth;
    enum ImGuiTableColumnFlags_PreferSortAscending = _Anonymous_13.ImGuiTableColumnFlags_PreferSortAscending;
    enum ImGuiTableColumnFlags_PreferSortDescending = _Anonymous_13.ImGuiTableColumnFlags_PreferSortDescending;
    enum ImGuiTableColumnFlags_IndentEnable = _Anonymous_13.ImGuiTableColumnFlags_IndentEnable;
    enum ImGuiTableColumnFlags_IndentDisable = _Anonymous_13.ImGuiTableColumnFlags_IndentDisable;
    enum ImGuiTableColumnFlags_IsEnabled = _Anonymous_13.ImGuiTableColumnFlags_IsEnabled;
    enum ImGuiTableColumnFlags_IsVisible = _Anonymous_13.ImGuiTableColumnFlags_IsVisible;
    enum ImGuiTableColumnFlags_IsSorted = _Anonymous_13.ImGuiTableColumnFlags_IsSorted;
    enum ImGuiTableColumnFlags_IsHovered = _Anonymous_13.ImGuiTableColumnFlags_IsHovered;
    enum ImGuiTableColumnFlags_WidthMask_ = _Anonymous_13.ImGuiTableColumnFlags_WidthMask_;
    enum ImGuiTableColumnFlags_IndentMask_ = _Anonymous_13.ImGuiTableColumnFlags_IndentMask_;
    enum ImGuiTableColumnFlags_StatusMask_ = _Anonymous_13.ImGuiTableColumnFlags_StatusMask_;
    enum ImGuiTableColumnFlags_NoDirectResize_ = _Anonymous_13.ImGuiTableColumnFlags_NoDirectResize_;
    alias ImGuiTableRowFlags_ = _Anonymous_14;
    enum _Anonymous_14
    {
        ImGuiTableRowFlags_None = 0,
        ImGuiTableRowFlags_Headers = 1,
    }
    enum ImGuiTableRowFlags_None = _Anonymous_14.ImGuiTableRowFlags_None;
    enum ImGuiTableRowFlags_Headers = _Anonymous_14.ImGuiTableRowFlags_Headers;
    alias ImGuiTableBgTarget_ = _Anonymous_15;
    enum _Anonymous_15
    {
        ImGuiTableBgTarget_None = 0,
        ImGuiTableBgTarget_RowBg0 = 1,
        ImGuiTableBgTarget_RowBg1 = 2,
        ImGuiTableBgTarget_CellBg = 3,
    }
    enum ImGuiTableBgTarget_None = _Anonymous_15.ImGuiTableBgTarget_None;
    enum ImGuiTableBgTarget_RowBg0 = _Anonymous_15.ImGuiTableBgTarget_RowBg0;
    enum ImGuiTableBgTarget_RowBg1 = _Anonymous_15.ImGuiTableBgTarget_RowBg1;
    enum ImGuiTableBgTarget_CellBg = _Anonymous_15.ImGuiTableBgTarget_CellBg;
    alias ImGuiFocusedFlags_ = _Anonymous_16;
    enum _Anonymous_16
    {
        ImGuiFocusedFlags_None = 0,
        ImGuiFocusedFlags_ChildWindows = 1,
        ImGuiFocusedFlags_RootWindow = 2,
        ImGuiFocusedFlags_AnyWindow = 4,
        ImGuiFocusedFlags_RootAndChildWindows = 3,
    }
    enum ImGuiFocusedFlags_None = _Anonymous_16.ImGuiFocusedFlags_None;
    enum ImGuiFocusedFlags_ChildWindows = _Anonymous_16.ImGuiFocusedFlags_ChildWindows;
    enum ImGuiFocusedFlags_RootWindow = _Anonymous_16.ImGuiFocusedFlags_RootWindow;
    enum ImGuiFocusedFlags_AnyWindow = _Anonymous_16.ImGuiFocusedFlags_AnyWindow;
    enum ImGuiFocusedFlags_RootAndChildWindows = _Anonymous_16.ImGuiFocusedFlags_RootAndChildWindows;
    alias ImGuiHoveredFlags_ = _Anonymous_17;
    enum _Anonymous_17
    {
        ImGuiHoveredFlags_None = 0,
        ImGuiHoveredFlags_ChildWindows = 1,
        ImGuiHoveredFlags_RootWindow = 2,
        ImGuiHoveredFlags_AnyWindow = 4,
        ImGuiHoveredFlags_AllowWhenBlockedByPopup = 8,
        ImGuiHoveredFlags_AllowWhenBlockedByActiveItem = 32,
        ImGuiHoveredFlags_AllowWhenOverlapped = 64,
        ImGuiHoveredFlags_AllowWhenDisabled = 128,
        ImGuiHoveredFlags_RectOnly = 104,
        ImGuiHoveredFlags_RootAndChildWindows = 3,
    }
    enum ImGuiHoveredFlags_None = _Anonymous_17.ImGuiHoveredFlags_None;
    enum ImGuiHoveredFlags_ChildWindows = _Anonymous_17.ImGuiHoveredFlags_ChildWindows;
    enum ImGuiHoveredFlags_RootWindow = _Anonymous_17.ImGuiHoveredFlags_RootWindow;
    enum ImGuiHoveredFlags_AnyWindow = _Anonymous_17.ImGuiHoveredFlags_AnyWindow;
    enum ImGuiHoveredFlags_AllowWhenBlockedByPopup = _Anonymous_17.ImGuiHoveredFlags_AllowWhenBlockedByPopup;
    enum ImGuiHoveredFlags_AllowWhenBlockedByActiveItem = _Anonymous_17.ImGuiHoveredFlags_AllowWhenBlockedByActiveItem;
    enum ImGuiHoveredFlags_AllowWhenOverlapped = _Anonymous_17.ImGuiHoveredFlags_AllowWhenOverlapped;
    enum ImGuiHoveredFlags_AllowWhenDisabled = _Anonymous_17.ImGuiHoveredFlags_AllowWhenDisabled;
    enum ImGuiHoveredFlags_RectOnly = _Anonymous_17.ImGuiHoveredFlags_RectOnly;
    enum ImGuiHoveredFlags_RootAndChildWindows = _Anonymous_17.ImGuiHoveredFlags_RootAndChildWindows;
    alias ImGuiDockNodeFlags_ = _Anonymous_18;
    enum _Anonymous_18
    {
        ImGuiDockNodeFlags_None = 0,
        ImGuiDockNodeFlags_KeepAliveOnly = 1,
        ImGuiDockNodeFlags_NoDockingInCentralNode = 4,
        ImGuiDockNodeFlags_PassthruCentralNode = 8,
        ImGuiDockNodeFlags_NoSplit = 16,
        ImGuiDockNodeFlags_NoResize = 32,
        ImGuiDockNodeFlags_AutoHideTabBar = 64,
    }
    enum ImGuiDockNodeFlags_None = _Anonymous_18.ImGuiDockNodeFlags_None;
    enum ImGuiDockNodeFlags_KeepAliveOnly = _Anonymous_18.ImGuiDockNodeFlags_KeepAliveOnly;
    enum ImGuiDockNodeFlags_NoDockingInCentralNode = _Anonymous_18.ImGuiDockNodeFlags_NoDockingInCentralNode;
    enum ImGuiDockNodeFlags_PassthruCentralNode = _Anonymous_18.ImGuiDockNodeFlags_PassthruCentralNode;
    enum ImGuiDockNodeFlags_NoSplit = _Anonymous_18.ImGuiDockNodeFlags_NoSplit;
    enum ImGuiDockNodeFlags_NoResize = _Anonymous_18.ImGuiDockNodeFlags_NoResize;
    enum ImGuiDockNodeFlags_AutoHideTabBar = _Anonymous_18.ImGuiDockNodeFlags_AutoHideTabBar;
    alias ImGuiDragDropFlags_ = _Anonymous_19;
    enum _Anonymous_19
    {
        ImGuiDragDropFlags_None = 0,
        ImGuiDragDropFlags_SourceNoPreviewTooltip = 1,
        ImGuiDragDropFlags_SourceNoDisableHover = 2,
        ImGuiDragDropFlags_SourceNoHoldToOpenOthers = 4,
        ImGuiDragDropFlags_SourceAllowNullID = 8,
        ImGuiDragDropFlags_SourceExtern = 16,
        ImGuiDragDropFlags_SourceAutoExpirePayload = 32,
        ImGuiDragDropFlags_AcceptBeforeDelivery = 1024,
        ImGuiDragDropFlags_AcceptNoDrawDefaultRect = 2048,
        ImGuiDragDropFlags_AcceptNoPreviewTooltip = 4096,
        ImGuiDragDropFlags_AcceptPeekOnly = 3072,
    }
    enum ImGuiDragDropFlags_None = _Anonymous_19.ImGuiDragDropFlags_None;
    enum ImGuiDragDropFlags_SourceNoPreviewTooltip = _Anonymous_19.ImGuiDragDropFlags_SourceNoPreviewTooltip;
    enum ImGuiDragDropFlags_SourceNoDisableHover = _Anonymous_19.ImGuiDragDropFlags_SourceNoDisableHover;
    enum ImGuiDragDropFlags_SourceNoHoldToOpenOthers = _Anonymous_19.ImGuiDragDropFlags_SourceNoHoldToOpenOthers;
    enum ImGuiDragDropFlags_SourceAllowNullID = _Anonymous_19.ImGuiDragDropFlags_SourceAllowNullID;
    enum ImGuiDragDropFlags_SourceExtern = _Anonymous_19.ImGuiDragDropFlags_SourceExtern;
    enum ImGuiDragDropFlags_SourceAutoExpirePayload = _Anonymous_19.ImGuiDragDropFlags_SourceAutoExpirePayload;
    enum ImGuiDragDropFlags_AcceptBeforeDelivery = _Anonymous_19.ImGuiDragDropFlags_AcceptBeforeDelivery;
    enum ImGuiDragDropFlags_AcceptNoDrawDefaultRect = _Anonymous_19.ImGuiDragDropFlags_AcceptNoDrawDefaultRect;
    enum ImGuiDragDropFlags_AcceptNoPreviewTooltip = _Anonymous_19.ImGuiDragDropFlags_AcceptNoPreviewTooltip;
    enum ImGuiDragDropFlags_AcceptPeekOnly = _Anonymous_19.ImGuiDragDropFlags_AcceptPeekOnly;
    alias ImGuiDataType_ = _Anonymous_20;
    enum _Anonymous_20
    {
        ImGuiDataType_S8 = 0,
        ImGuiDataType_U8 = 1,
        ImGuiDataType_S16 = 2,
        ImGuiDataType_U16 = 3,
        ImGuiDataType_S32 = 4,
        ImGuiDataType_U32 = 5,
        ImGuiDataType_S64 = 6,
        ImGuiDataType_U64 = 7,
        ImGuiDataType_Float = 8,
        ImGuiDataType_Double = 9,
        ImGuiDataType_COUNT = 10,
    }
    enum ImGuiDataType_S8 = _Anonymous_20.ImGuiDataType_S8;
    enum ImGuiDataType_U8 = _Anonymous_20.ImGuiDataType_U8;
    enum ImGuiDataType_S16 = _Anonymous_20.ImGuiDataType_S16;
    enum ImGuiDataType_U16 = _Anonymous_20.ImGuiDataType_U16;
    enum ImGuiDataType_S32 = _Anonymous_20.ImGuiDataType_S32;
    enum ImGuiDataType_U32 = _Anonymous_20.ImGuiDataType_U32;
    enum ImGuiDataType_S64 = _Anonymous_20.ImGuiDataType_S64;
    enum ImGuiDataType_U64 = _Anonymous_20.ImGuiDataType_U64;
    enum ImGuiDataType_Float = _Anonymous_20.ImGuiDataType_Float;
    enum ImGuiDataType_Double = _Anonymous_20.ImGuiDataType_Double;
    enum ImGuiDataType_COUNT = _Anonymous_20.ImGuiDataType_COUNT;
    alias ImGuiDir_ = _Anonymous_21;
    enum _Anonymous_21
    {
        ImGuiDir_None = -1,
        ImGuiDir_Left = 0,
        ImGuiDir_Right = 1,
        ImGuiDir_Up = 2,
        ImGuiDir_Down = 3,
        ImGuiDir_COUNT = 4,
    }
    enum ImGuiDir_None = _Anonymous_21.ImGuiDir_None;
    enum ImGuiDir_Left = _Anonymous_21.ImGuiDir_Left;
    enum ImGuiDir_Right = _Anonymous_21.ImGuiDir_Right;
    enum ImGuiDir_Up = _Anonymous_21.ImGuiDir_Up;
    enum ImGuiDir_Down = _Anonymous_21.ImGuiDir_Down;
    enum ImGuiDir_COUNT = _Anonymous_21.ImGuiDir_COUNT;
    alias ImGuiSortDirection_ = _Anonymous_22;
    enum _Anonymous_22
    {
        ImGuiSortDirection_None = 0,
        ImGuiSortDirection_Ascending = 1,
        ImGuiSortDirection_Descending = 2,
    }
    enum ImGuiSortDirection_None = _Anonymous_22.ImGuiSortDirection_None;
    enum ImGuiSortDirection_Ascending = _Anonymous_22.ImGuiSortDirection_Ascending;
    enum ImGuiSortDirection_Descending = _Anonymous_22.ImGuiSortDirection_Descending;
    alias ImGuiKey_ = _Anonymous_23;
    enum _Anonymous_23
    {
        ImGuiKey_Tab = 0,
        ImGuiKey_LeftArrow = 1,
        ImGuiKey_RightArrow = 2,
        ImGuiKey_UpArrow = 3,
        ImGuiKey_DownArrow = 4,
        ImGuiKey_PageUp = 5,
        ImGuiKey_PageDown = 6,
        ImGuiKey_Home = 7,
        ImGuiKey_End = 8,
        ImGuiKey_Insert = 9,
        ImGuiKey_Delete = 10,
        ImGuiKey_Backspace = 11,
        ImGuiKey_Space = 12,
        ImGuiKey_Enter = 13,
        ImGuiKey_Escape = 14,
        ImGuiKey_KeyPadEnter = 15,
        ImGuiKey_A = 16,
        ImGuiKey_C = 17,
        ImGuiKey_V = 18,
        ImGuiKey_X = 19,
        ImGuiKey_Y = 20,
        ImGuiKey_Z = 21,
        ImGuiKey_COUNT = 22,
    }
    enum ImGuiKey_Tab = _Anonymous_23.ImGuiKey_Tab;
    enum ImGuiKey_LeftArrow = _Anonymous_23.ImGuiKey_LeftArrow;
    enum ImGuiKey_RightArrow = _Anonymous_23.ImGuiKey_RightArrow;
    enum ImGuiKey_UpArrow = _Anonymous_23.ImGuiKey_UpArrow;
    enum ImGuiKey_DownArrow = _Anonymous_23.ImGuiKey_DownArrow;
    enum ImGuiKey_PageUp = _Anonymous_23.ImGuiKey_PageUp;
    enum ImGuiKey_PageDown = _Anonymous_23.ImGuiKey_PageDown;
    enum ImGuiKey_Home = _Anonymous_23.ImGuiKey_Home;
    enum ImGuiKey_End = _Anonymous_23.ImGuiKey_End;
    enum ImGuiKey_Insert = _Anonymous_23.ImGuiKey_Insert;
    enum ImGuiKey_Delete = _Anonymous_23.ImGuiKey_Delete;
    enum ImGuiKey_Backspace = _Anonymous_23.ImGuiKey_Backspace;
    enum ImGuiKey_Space = _Anonymous_23.ImGuiKey_Space;
    enum ImGuiKey_Enter = _Anonymous_23.ImGuiKey_Enter;
    enum ImGuiKey_Escape = _Anonymous_23.ImGuiKey_Escape;
    enum ImGuiKey_KeyPadEnter = _Anonymous_23.ImGuiKey_KeyPadEnter;
    enum ImGuiKey_A = _Anonymous_23.ImGuiKey_A;
    enum ImGuiKey_C = _Anonymous_23.ImGuiKey_C;
    enum ImGuiKey_V = _Anonymous_23.ImGuiKey_V;
    enum ImGuiKey_X = _Anonymous_23.ImGuiKey_X;
    enum ImGuiKey_Y = _Anonymous_23.ImGuiKey_Y;
    enum ImGuiKey_Z = _Anonymous_23.ImGuiKey_Z;
    enum ImGuiKey_COUNT = _Anonymous_23.ImGuiKey_COUNT;
    alias ImGuiKeyModFlags_ = _Anonymous_24;
    enum _Anonymous_24
    {
        ImGuiKeyModFlags_None = 0,
        ImGuiKeyModFlags_Ctrl = 1,
        ImGuiKeyModFlags_Shift = 2,
        ImGuiKeyModFlags_Alt = 4,
        ImGuiKeyModFlags_Super = 8,
    }
    enum ImGuiKeyModFlags_None = _Anonymous_24.ImGuiKeyModFlags_None;
    enum ImGuiKeyModFlags_Ctrl = _Anonymous_24.ImGuiKeyModFlags_Ctrl;
    enum ImGuiKeyModFlags_Shift = _Anonymous_24.ImGuiKeyModFlags_Shift;
    enum ImGuiKeyModFlags_Alt = _Anonymous_24.ImGuiKeyModFlags_Alt;
    enum ImGuiKeyModFlags_Super = _Anonymous_24.ImGuiKeyModFlags_Super;
    alias ImGuiNavInput_ = _Anonymous_25;
    enum _Anonymous_25
    {
        ImGuiNavInput_Activate = 0,
        ImGuiNavInput_Cancel = 1,
        ImGuiNavInput_Input = 2,
        ImGuiNavInput_Menu = 3,
        ImGuiNavInput_DpadLeft = 4,
        ImGuiNavInput_DpadRight = 5,
        ImGuiNavInput_DpadUp = 6,
        ImGuiNavInput_DpadDown = 7,
        ImGuiNavInput_LStickLeft = 8,
        ImGuiNavInput_LStickRight = 9,
        ImGuiNavInput_LStickUp = 10,
        ImGuiNavInput_LStickDown = 11,
        ImGuiNavInput_FocusPrev = 12,
        ImGuiNavInput_FocusNext = 13,
        ImGuiNavInput_TweakSlow = 14,
        ImGuiNavInput_TweakFast = 15,
        ImGuiNavInput_KeyLeft_ = 16,
        ImGuiNavInput_KeyRight_ = 17,
        ImGuiNavInput_KeyUp_ = 18,
        ImGuiNavInput_KeyDown_ = 19,
        ImGuiNavInput_COUNT = 20,
        ImGuiNavInput_InternalStart_ = 16,
    }
    enum ImGuiNavInput_Activate = _Anonymous_25.ImGuiNavInput_Activate;
    enum ImGuiNavInput_Cancel = _Anonymous_25.ImGuiNavInput_Cancel;
    enum ImGuiNavInput_Input = _Anonymous_25.ImGuiNavInput_Input;
    enum ImGuiNavInput_Menu = _Anonymous_25.ImGuiNavInput_Menu;
    enum ImGuiNavInput_DpadLeft = _Anonymous_25.ImGuiNavInput_DpadLeft;
    enum ImGuiNavInput_DpadRight = _Anonymous_25.ImGuiNavInput_DpadRight;
    enum ImGuiNavInput_DpadUp = _Anonymous_25.ImGuiNavInput_DpadUp;
    enum ImGuiNavInput_DpadDown = _Anonymous_25.ImGuiNavInput_DpadDown;
    enum ImGuiNavInput_LStickLeft = _Anonymous_25.ImGuiNavInput_LStickLeft;
    enum ImGuiNavInput_LStickRight = _Anonymous_25.ImGuiNavInput_LStickRight;
    enum ImGuiNavInput_LStickUp = _Anonymous_25.ImGuiNavInput_LStickUp;
    enum ImGuiNavInput_LStickDown = _Anonymous_25.ImGuiNavInput_LStickDown;
    enum ImGuiNavInput_FocusPrev = _Anonymous_25.ImGuiNavInput_FocusPrev;
    enum ImGuiNavInput_FocusNext = _Anonymous_25.ImGuiNavInput_FocusNext;
    enum ImGuiNavInput_TweakSlow = _Anonymous_25.ImGuiNavInput_TweakSlow;
    enum ImGuiNavInput_TweakFast = _Anonymous_25.ImGuiNavInput_TweakFast;
    enum ImGuiNavInput_KeyLeft_ = _Anonymous_25.ImGuiNavInput_KeyLeft_;
    enum ImGuiNavInput_KeyRight_ = _Anonymous_25.ImGuiNavInput_KeyRight_;
    enum ImGuiNavInput_KeyUp_ = _Anonymous_25.ImGuiNavInput_KeyUp_;
    enum ImGuiNavInput_KeyDown_ = _Anonymous_25.ImGuiNavInput_KeyDown_;
    enum ImGuiNavInput_COUNT = _Anonymous_25.ImGuiNavInput_COUNT;
    enum ImGuiNavInput_InternalStart_ = _Anonymous_25.ImGuiNavInput_InternalStart_;
    alias ImGuiConfigFlags_ = _Anonymous_26;
    enum _Anonymous_26
    {
        ImGuiConfigFlags_None = 0,
        ImGuiConfigFlags_NavEnableKeyboard = 1,
        ImGuiConfigFlags_NavEnableGamepad = 2,
        ImGuiConfigFlags_NavEnableSetMousePos = 4,
        ImGuiConfigFlags_NavNoCaptureKeyboard = 8,
        ImGuiConfigFlags_NoMouse = 16,
        ImGuiConfigFlags_NoMouseCursorChange = 32,
        ImGuiConfigFlags_DockingEnable = 64,
        ImGuiConfigFlags_ViewportsEnable = 1024,
        ImGuiConfigFlags_DpiEnableScaleViewports = 16384,
        ImGuiConfigFlags_DpiEnableScaleFonts = 32768,
        ImGuiConfigFlags_IsSRGB = 1048576,
        ImGuiConfigFlags_IsTouchScreen = 2097152,
    }
    enum ImGuiConfigFlags_None = _Anonymous_26.ImGuiConfigFlags_None;
    enum ImGuiConfigFlags_NavEnableKeyboard = _Anonymous_26.ImGuiConfigFlags_NavEnableKeyboard;
    enum ImGuiConfigFlags_NavEnableGamepad = _Anonymous_26.ImGuiConfigFlags_NavEnableGamepad;
    enum ImGuiConfigFlags_NavEnableSetMousePos = _Anonymous_26.ImGuiConfigFlags_NavEnableSetMousePos;
    enum ImGuiConfigFlags_NavNoCaptureKeyboard = _Anonymous_26.ImGuiConfigFlags_NavNoCaptureKeyboard;
    enum ImGuiConfigFlags_NoMouse = _Anonymous_26.ImGuiConfigFlags_NoMouse;
    enum ImGuiConfigFlags_NoMouseCursorChange = _Anonymous_26.ImGuiConfigFlags_NoMouseCursorChange;
    enum ImGuiConfigFlags_DockingEnable = _Anonymous_26.ImGuiConfigFlags_DockingEnable;
    enum ImGuiConfigFlags_ViewportsEnable = _Anonymous_26.ImGuiConfigFlags_ViewportsEnable;
    enum ImGuiConfigFlags_DpiEnableScaleViewports = _Anonymous_26.ImGuiConfigFlags_DpiEnableScaleViewports;
    enum ImGuiConfigFlags_DpiEnableScaleFonts = _Anonymous_26.ImGuiConfigFlags_DpiEnableScaleFonts;
    enum ImGuiConfigFlags_IsSRGB = _Anonymous_26.ImGuiConfigFlags_IsSRGB;
    enum ImGuiConfigFlags_IsTouchScreen = _Anonymous_26.ImGuiConfigFlags_IsTouchScreen;
    alias ImGuiBackendFlags_ = _Anonymous_27;
    enum _Anonymous_27
    {
        ImGuiBackendFlags_None = 0,
        ImGuiBackendFlags_HasGamepad = 1,
        ImGuiBackendFlags_HasMouseCursors = 2,
        ImGuiBackendFlags_HasSetMousePos = 4,
        ImGuiBackendFlags_RendererHasVtxOffset = 8,
        ImGuiBackendFlags_PlatformHasViewports = 1024,
        ImGuiBackendFlags_HasMouseHoveredViewport = 2048,
        ImGuiBackendFlags_RendererHasViewports = 4096,
    }
    enum ImGuiBackendFlags_None = _Anonymous_27.ImGuiBackendFlags_None;
    enum ImGuiBackendFlags_HasGamepad = _Anonymous_27.ImGuiBackendFlags_HasGamepad;
    enum ImGuiBackendFlags_HasMouseCursors = _Anonymous_27.ImGuiBackendFlags_HasMouseCursors;
    enum ImGuiBackendFlags_HasSetMousePos = _Anonymous_27.ImGuiBackendFlags_HasSetMousePos;
    enum ImGuiBackendFlags_RendererHasVtxOffset = _Anonymous_27.ImGuiBackendFlags_RendererHasVtxOffset;
    enum ImGuiBackendFlags_PlatformHasViewports = _Anonymous_27.ImGuiBackendFlags_PlatformHasViewports;
    enum ImGuiBackendFlags_HasMouseHoveredViewport = _Anonymous_27.ImGuiBackendFlags_HasMouseHoveredViewport;
    enum ImGuiBackendFlags_RendererHasViewports = _Anonymous_27.ImGuiBackendFlags_RendererHasViewports;
    alias ImGuiCol_ = _Anonymous_28;
    enum _Anonymous_28
    {
        ImGuiCol_Text = 0,
        ImGuiCol_TextDisabled = 1,
        ImGuiCol_WindowBg = 2,
        ImGuiCol_ChildBg = 3,
        ImGuiCol_PopupBg = 4,
        ImGuiCol_Border = 5,
        ImGuiCol_BorderShadow = 6,
        ImGuiCol_FrameBg = 7,
        ImGuiCol_FrameBgHovered = 8,
        ImGuiCol_FrameBgActive = 9,
        ImGuiCol_TitleBg = 10,
        ImGuiCol_TitleBgActive = 11,
        ImGuiCol_TitleBgCollapsed = 12,
        ImGuiCol_MenuBarBg = 13,
        ImGuiCol_ScrollbarBg = 14,
        ImGuiCol_ScrollbarGrab = 15,
        ImGuiCol_ScrollbarGrabHovered = 16,
        ImGuiCol_ScrollbarGrabActive = 17,
        ImGuiCol_CheckMark = 18,
        ImGuiCol_SliderGrab = 19,
        ImGuiCol_SliderGrabActive = 20,
        ImGuiCol_Button = 21,
        ImGuiCol_ButtonHovered = 22,
        ImGuiCol_ButtonActive = 23,
        ImGuiCol_Header = 24,
        ImGuiCol_HeaderHovered = 25,
        ImGuiCol_HeaderActive = 26,
        ImGuiCol_Separator = 27,
        ImGuiCol_SeparatorHovered = 28,
        ImGuiCol_SeparatorActive = 29,
        ImGuiCol_ResizeGrip = 30,
        ImGuiCol_ResizeGripHovered = 31,
        ImGuiCol_ResizeGripActive = 32,
        ImGuiCol_Tab = 33,
        ImGuiCol_TabHovered = 34,
        ImGuiCol_TabActive = 35,
        ImGuiCol_TabUnfocused = 36,
        ImGuiCol_TabUnfocusedActive = 37,
        ImGuiCol_DockingPreview = 38,
        ImGuiCol_DockingEmptyBg = 39,
        ImGuiCol_PlotLines = 40,
        ImGuiCol_PlotLinesHovered = 41,
        ImGuiCol_PlotHistogram = 42,
        ImGuiCol_PlotHistogramHovered = 43,
        ImGuiCol_TableHeaderBg = 44,
        ImGuiCol_TableBorderStrong = 45,
        ImGuiCol_TableBorderLight = 46,
        ImGuiCol_TableRowBg = 47,
        ImGuiCol_TableRowBgAlt = 48,
        ImGuiCol_TextSelectedBg = 49,
        ImGuiCol_DragDropTarget = 50,
        ImGuiCol_NavHighlight = 51,
        ImGuiCol_NavWindowingHighlight = 52,
        ImGuiCol_NavWindowingDimBg = 53,
        ImGuiCol_ModalWindowDimBg = 54,
        ImGuiCol_COUNT = 55,
    }
    enum ImGuiCol_Text = _Anonymous_28.ImGuiCol_Text;
    enum ImGuiCol_TextDisabled = _Anonymous_28.ImGuiCol_TextDisabled;
    enum ImGuiCol_WindowBg = _Anonymous_28.ImGuiCol_WindowBg;
    enum ImGuiCol_ChildBg = _Anonymous_28.ImGuiCol_ChildBg;
    enum ImGuiCol_PopupBg = _Anonymous_28.ImGuiCol_PopupBg;
    enum ImGuiCol_Border = _Anonymous_28.ImGuiCol_Border;
    enum ImGuiCol_BorderShadow = _Anonymous_28.ImGuiCol_BorderShadow;
    enum ImGuiCol_FrameBg = _Anonymous_28.ImGuiCol_FrameBg;
    enum ImGuiCol_FrameBgHovered = _Anonymous_28.ImGuiCol_FrameBgHovered;
    enum ImGuiCol_FrameBgActive = _Anonymous_28.ImGuiCol_FrameBgActive;
    enum ImGuiCol_TitleBg = _Anonymous_28.ImGuiCol_TitleBg;
    enum ImGuiCol_TitleBgActive = _Anonymous_28.ImGuiCol_TitleBgActive;
    enum ImGuiCol_TitleBgCollapsed = _Anonymous_28.ImGuiCol_TitleBgCollapsed;
    enum ImGuiCol_MenuBarBg = _Anonymous_28.ImGuiCol_MenuBarBg;
    enum ImGuiCol_ScrollbarBg = _Anonymous_28.ImGuiCol_ScrollbarBg;
    enum ImGuiCol_ScrollbarGrab = _Anonymous_28.ImGuiCol_ScrollbarGrab;
    enum ImGuiCol_ScrollbarGrabHovered = _Anonymous_28.ImGuiCol_ScrollbarGrabHovered;
    enum ImGuiCol_ScrollbarGrabActive = _Anonymous_28.ImGuiCol_ScrollbarGrabActive;
    enum ImGuiCol_CheckMark = _Anonymous_28.ImGuiCol_CheckMark;
    enum ImGuiCol_SliderGrab = _Anonymous_28.ImGuiCol_SliderGrab;
    enum ImGuiCol_SliderGrabActive = _Anonymous_28.ImGuiCol_SliderGrabActive;
    enum ImGuiCol_Button = _Anonymous_28.ImGuiCol_Button;
    enum ImGuiCol_ButtonHovered = _Anonymous_28.ImGuiCol_ButtonHovered;
    enum ImGuiCol_ButtonActive = _Anonymous_28.ImGuiCol_ButtonActive;
    enum ImGuiCol_Header = _Anonymous_28.ImGuiCol_Header;
    enum ImGuiCol_HeaderHovered = _Anonymous_28.ImGuiCol_HeaderHovered;
    enum ImGuiCol_HeaderActive = _Anonymous_28.ImGuiCol_HeaderActive;
    enum ImGuiCol_Separator = _Anonymous_28.ImGuiCol_Separator;
    enum ImGuiCol_SeparatorHovered = _Anonymous_28.ImGuiCol_SeparatorHovered;
    enum ImGuiCol_SeparatorActive = _Anonymous_28.ImGuiCol_SeparatorActive;
    enum ImGuiCol_ResizeGrip = _Anonymous_28.ImGuiCol_ResizeGrip;
    enum ImGuiCol_ResizeGripHovered = _Anonymous_28.ImGuiCol_ResizeGripHovered;
    enum ImGuiCol_ResizeGripActive = _Anonymous_28.ImGuiCol_ResizeGripActive;
    enum ImGuiCol_Tab = _Anonymous_28.ImGuiCol_Tab;
    enum ImGuiCol_TabHovered = _Anonymous_28.ImGuiCol_TabHovered;
    enum ImGuiCol_TabActive = _Anonymous_28.ImGuiCol_TabActive;
    enum ImGuiCol_TabUnfocused = _Anonymous_28.ImGuiCol_TabUnfocused;
    enum ImGuiCol_TabUnfocusedActive = _Anonymous_28.ImGuiCol_TabUnfocusedActive;
    enum ImGuiCol_DockingPreview = _Anonymous_28.ImGuiCol_DockingPreview;
    enum ImGuiCol_DockingEmptyBg = _Anonymous_28.ImGuiCol_DockingEmptyBg;
    enum ImGuiCol_PlotLines = _Anonymous_28.ImGuiCol_PlotLines;
    enum ImGuiCol_PlotLinesHovered = _Anonymous_28.ImGuiCol_PlotLinesHovered;
    enum ImGuiCol_PlotHistogram = _Anonymous_28.ImGuiCol_PlotHistogram;
    enum ImGuiCol_PlotHistogramHovered = _Anonymous_28.ImGuiCol_PlotHistogramHovered;
    enum ImGuiCol_TableHeaderBg = _Anonymous_28.ImGuiCol_TableHeaderBg;
    enum ImGuiCol_TableBorderStrong = _Anonymous_28.ImGuiCol_TableBorderStrong;
    enum ImGuiCol_TableBorderLight = _Anonymous_28.ImGuiCol_TableBorderLight;
    enum ImGuiCol_TableRowBg = _Anonymous_28.ImGuiCol_TableRowBg;
    enum ImGuiCol_TableRowBgAlt = _Anonymous_28.ImGuiCol_TableRowBgAlt;
    enum ImGuiCol_TextSelectedBg = _Anonymous_28.ImGuiCol_TextSelectedBg;
    enum ImGuiCol_DragDropTarget = _Anonymous_28.ImGuiCol_DragDropTarget;
    enum ImGuiCol_NavHighlight = _Anonymous_28.ImGuiCol_NavHighlight;
    enum ImGuiCol_NavWindowingHighlight = _Anonymous_28.ImGuiCol_NavWindowingHighlight;
    enum ImGuiCol_NavWindowingDimBg = _Anonymous_28.ImGuiCol_NavWindowingDimBg;
    enum ImGuiCol_ModalWindowDimBg = _Anonymous_28.ImGuiCol_ModalWindowDimBg;
    enum ImGuiCol_COUNT = _Anonymous_28.ImGuiCol_COUNT;
    alias ImGuiStyleVar_ = _Anonymous_29;
    enum _Anonymous_29
    {
        ImGuiStyleVar_Alpha = 0,
        ImGuiStyleVar_DisabledAlpha = 1,
        ImGuiStyleVar_WindowPadding = 2,
        ImGuiStyleVar_WindowRounding = 3,
        ImGuiStyleVar_WindowBorderSize = 4,
        ImGuiStyleVar_WindowMinSize = 5,
        ImGuiStyleVar_WindowTitleAlign = 6,
        ImGuiStyleVar_ChildRounding = 7,
        ImGuiStyleVar_ChildBorderSize = 8,
        ImGuiStyleVar_PopupRounding = 9,
        ImGuiStyleVar_PopupBorderSize = 10,
        ImGuiStyleVar_FramePadding = 11,
        ImGuiStyleVar_FrameRounding = 12,
        ImGuiStyleVar_FrameBorderSize = 13,
        ImGuiStyleVar_ItemSpacing = 14,
        ImGuiStyleVar_ItemInnerSpacing = 15,
        ImGuiStyleVar_IndentSpacing = 16,
        ImGuiStyleVar_CellPadding = 17,
        ImGuiStyleVar_ScrollbarSize = 18,
        ImGuiStyleVar_ScrollbarRounding = 19,
        ImGuiStyleVar_GrabMinSize = 20,
        ImGuiStyleVar_GrabRounding = 21,
        ImGuiStyleVar_TabRounding = 22,
        ImGuiStyleVar_ButtonTextAlign = 23,
        ImGuiStyleVar_SelectableTextAlign = 24,
        ImGuiStyleVar_COUNT = 25,
    }
    enum ImGuiStyleVar_Alpha = _Anonymous_29.ImGuiStyleVar_Alpha;
    enum ImGuiStyleVar_DisabledAlpha = _Anonymous_29.ImGuiStyleVar_DisabledAlpha;
    enum ImGuiStyleVar_WindowPadding = _Anonymous_29.ImGuiStyleVar_WindowPadding;
    enum ImGuiStyleVar_WindowRounding = _Anonymous_29.ImGuiStyleVar_WindowRounding;
    enum ImGuiStyleVar_WindowBorderSize = _Anonymous_29.ImGuiStyleVar_WindowBorderSize;
    enum ImGuiStyleVar_WindowMinSize = _Anonymous_29.ImGuiStyleVar_WindowMinSize;
    enum ImGuiStyleVar_WindowTitleAlign = _Anonymous_29.ImGuiStyleVar_WindowTitleAlign;
    enum ImGuiStyleVar_ChildRounding = _Anonymous_29.ImGuiStyleVar_ChildRounding;
    enum ImGuiStyleVar_ChildBorderSize = _Anonymous_29.ImGuiStyleVar_ChildBorderSize;
    enum ImGuiStyleVar_PopupRounding = _Anonymous_29.ImGuiStyleVar_PopupRounding;
    enum ImGuiStyleVar_PopupBorderSize = _Anonymous_29.ImGuiStyleVar_PopupBorderSize;
    enum ImGuiStyleVar_FramePadding = _Anonymous_29.ImGuiStyleVar_FramePadding;
    enum ImGuiStyleVar_FrameRounding = _Anonymous_29.ImGuiStyleVar_FrameRounding;
    enum ImGuiStyleVar_FrameBorderSize = _Anonymous_29.ImGuiStyleVar_FrameBorderSize;
    enum ImGuiStyleVar_ItemSpacing = _Anonymous_29.ImGuiStyleVar_ItemSpacing;
    enum ImGuiStyleVar_ItemInnerSpacing = _Anonymous_29.ImGuiStyleVar_ItemInnerSpacing;
    enum ImGuiStyleVar_IndentSpacing = _Anonymous_29.ImGuiStyleVar_IndentSpacing;
    enum ImGuiStyleVar_CellPadding = _Anonymous_29.ImGuiStyleVar_CellPadding;
    enum ImGuiStyleVar_ScrollbarSize = _Anonymous_29.ImGuiStyleVar_ScrollbarSize;
    enum ImGuiStyleVar_ScrollbarRounding = _Anonymous_29.ImGuiStyleVar_ScrollbarRounding;
    enum ImGuiStyleVar_GrabMinSize = _Anonymous_29.ImGuiStyleVar_GrabMinSize;
    enum ImGuiStyleVar_GrabRounding = _Anonymous_29.ImGuiStyleVar_GrabRounding;
    enum ImGuiStyleVar_TabRounding = _Anonymous_29.ImGuiStyleVar_TabRounding;
    enum ImGuiStyleVar_ButtonTextAlign = _Anonymous_29.ImGuiStyleVar_ButtonTextAlign;
    enum ImGuiStyleVar_SelectableTextAlign = _Anonymous_29.ImGuiStyleVar_SelectableTextAlign;
    enum ImGuiStyleVar_COUNT = _Anonymous_29.ImGuiStyleVar_COUNT;
    alias ImGuiButtonFlags_ = _Anonymous_30;
    enum _Anonymous_30
    {
        ImGuiButtonFlags_None = 0,
        ImGuiButtonFlags_MouseButtonLeft = 1,
        ImGuiButtonFlags_MouseButtonRight = 2,
        ImGuiButtonFlags_MouseButtonMiddle = 4,
        ImGuiButtonFlags_MouseButtonMask_ = 7,
        ImGuiButtonFlags_MouseButtonDefault_ = 1,
    }
    enum ImGuiButtonFlags_None = _Anonymous_30.ImGuiButtonFlags_None;
    enum ImGuiButtonFlags_MouseButtonLeft = _Anonymous_30.ImGuiButtonFlags_MouseButtonLeft;
    enum ImGuiButtonFlags_MouseButtonRight = _Anonymous_30.ImGuiButtonFlags_MouseButtonRight;
    enum ImGuiButtonFlags_MouseButtonMiddle = _Anonymous_30.ImGuiButtonFlags_MouseButtonMiddle;
    enum ImGuiButtonFlags_MouseButtonMask_ = _Anonymous_30.ImGuiButtonFlags_MouseButtonMask_;
    enum ImGuiButtonFlags_MouseButtonDefault_ = _Anonymous_30.ImGuiButtonFlags_MouseButtonDefault_;
    alias ImGuiColorEditFlags_ = _Anonymous_31;
    enum _Anonymous_31
    {
        ImGuiColorEditFlags_None = 0,
        ImGuiColorEditFlags_NoAlpha = 2,
        ImGuiColorEditFlags_NoPicker = 4,
        ImGuiColorEditFlags_NoOptions = 8,
        ImGuiColorEditFlags_NoSmallPreview = 16,
        ImGuiColorEditFlags_NoInputs = 32,
        ImGuiColorEditFlags_NoTooltip = 64,
        ImGuiColorEditFlags_NoLabel = 128,
        ImGuiColorEditFlags_NoSidePreview = 256,
        ImGuiColorEditFlags_NoDragDrop = 512,
        ImGuiColorEditFlags_NoBorder = 1024,
        ImGuiColorEditFlags_AlphaBar = 65536,
        ImGuiColorEditFlags_AlphaPreview = 131072,
        ImGuiColorEditFlags_AlphaPreviewHalf = 262144,
        ImGuiColorEditFlags_HDR = 524288,
        ImGuiColorEditFlags_DisplayRGB = 1048576,
        ImGuiColorEditFlags_DisplayHSV = 2097152,
        ImGuiColorEditFlags_DisplayHex = 4194304,
        ImGuiColorEditFlags_Uint8 = 8388608,
        ImGuiColorEditFlags_Float = 16777216,
        ImGuiColorEditFlags_PickerHueBar = 33554432,
        ImGuiColorEditFlags_PickerHueWheel = 67108864,
        ImGuiColorEditFlags_InputRGB = 134217728,
        ImGuiColorEditFlags_InputHSV = 268435456,
        ImGuiColorEditFlags_DefaultOptions_ = 177209344,
        ImGuiColorEditFlags_DisplayMask_ = 7340032,
        ImGuiColorEditFlags_DataTypeMask_ = 25165824,
        ImGuiColorEditFlags_PickerMask_ = 100663296,
        ImGuiColorEditFlags_InputMask_ = 402653184,
    }
    enum ImGuiColorEditFlags_None = _Anonymous_31.ImGuiColorEditFlags_None;
    enum ImGuiColorEditFlags_NoAlpha = _Anonymous_31.ImGuiColorEditFlags_NoAlpha;
    enum ImGuiColorEditFlags_NoPicker = _Anonymous_31.ImGuiColorEditFlags_NoPicker;
    enum ImGuiColorEditFlags_NoOptions = _Anonymous_31.ImGuiColorEditFlags_NoOptions;
    enum ImGuiColorEditFlags_NoSmallPreview = _Anonymous_31.ImGuiColorEditFlags_NoSmallPreview;
    enum ImGuiColorEditFlags_NoInputs = _Anonymous_31.ImGuiColorEditFlags_NoInputs;
    enum ImGuiColorEditFlags_NoTooltip = _Anonymous_31.ImGuiColorEditFlags_NoTooltip;
    enum ImGuiColorEditFlags_NoLabel = _Anonymous_31.ImGuiColorEditFlags_NoLabel;
    enum ImGuiColorEditFlags_NoSidePreview = _Anonymous_31.ImGuiColorEditFlags_NoSidePreview;
    enum ImGuiColorEditFlags_NoDragDrop = _Anonymous_31.ImGuiColorEditFlags_NoDragDrop;
    enum ImGuiColorEditFlags_NoBorder = _Anonymous_31.ImGuiColorEditFlags_NoBorder;
    enum ImGuiColorEditFlags_AlphaBar = _Anonymous_31.ImGuiColorEditFlags_AlphaBar;
    enum ImGuiColorEditFlags_AlphaPreview = _Anonymous_31.ImGuiColorEditFlags_AlphaPreview;
    enum ImGuiColorEditFlags_AlphaPreviewHalf = _Anonymous_31.ImGuiColorEditFlags_AlphaPreviewHalf;
    enum ImGuiColorEditFlags_HDR = _Anonymous_31.ImGuiColorEditFlags_HDR;
    enum ImGuiColorEditFlags_DisplayRGB = _Anonymous_31.ImGuiColorEditFlags_DisplayRGB;
    enum ImGuiColorEditFlags_DisplayHSV = _Anonymous_31.ImGuiColorEditFlags_DisplayHSV;
    enum ImGuiColorEditFlags_DisplayHex = _Anonymous_31.ImGuiColorEditFlags_DisplayHex;
    enum ImGuiColorEditFlags_Uint8 = _Anonymous_31.ImGuiColorEditFlags_Uint8;
    enum ImGuiColorEditFlags_Float = _Anonymous_31.ImGuiColorEditFlags_Float;
    enum ImGuiColorEditFlags_PickerHueBar = _Anonymous_31.ImGuiColorEditFlags_PickerHueBar;
    enum ImGuiColorEditFlags_PickerHueWheel = _Anonymous_31.ImGuiColorEditFlags_PickerHueWheel;
    enum ImGuiColorEditFlags_InputRGB = _Anonymous_31.ImGuiColorEditFlags_InputRGB;
    enum ImGuiColorEditFlags_InputHSV = _Anonymous_31.ImGuiColorEditFlags_InputHSV;
    enum ImGuiColorEditFlags_DefaultOptions_ = _Anonymous_31.ImGuiColorEditFlags_DefaultOptions_;
    enum ImGuiColorEditFlags_DisplayMask_ = _Anonymous_31.ImGuiColorEditFlags_DisplayMask_;
    enum ImGuiColorEditFlags_DataTypeMask_ = _Anonymous_31.ImGuiColorEditFlags_DataTypeMask_;
    enum ImGuiColorEditFlags_PickerMask_ = _Anonymous_31.ImGuiColorEditFlags_PickerMask_;
    enum ImGuiColorEditFlags_InputMask_ = _Anonymous_31.ImGuiColorEditFlags_InputMask_;
    alias ImGuiSliderFlags_ = _Anonymous_32;
    enum _Anonymous_32
    {
        ImGuiSliderFlags_None = 0,
        ImGuiSliderFlags_AlwaysClamp = 16,
        ImGuiSliderFlags_Logarithmic = 32,
        ImGuiSliderFlags_NoRoundToFormat = 64,
        ImGuiSliderFlags_NoInput = 128,
        ImGuiSliderFlags_InvalidMask_ = 1879048207,
    }
    enum ImGuiSliderFlags_None = _Anonymous_32.ImGuiSliderFlags_None;
    enum ImGuiSliderFlags_AlwaysClamp = _Anonymous_32.ImGuiSliderFlags_AlwaysClamp;
    enum ImGuiSliderFlags_Logarithmic = _Anonymous_32.ImGuiSliderFlags_Logarithmic;
    enum ImGuiSliderFlags_NoRoundToFormat = _Anonymous_32.ImGuiSliderFlags_NoRoundToFormat;
    enum ImGuiSliderFlags_NoInput = _Anonymous_32.ImGuiSliderFlags_NoInput;
    enum ImGuiSliderFlags_InvalidMask_ = _Anonymous_32.ImGuiSliderFlags_InvalidMask_;
    alias ImGuiMouseButton_ = _Anonymous_33;
    enum _Anonymous_33
    {
        ImGuiMouseButton_Left = 0,
        ImGuiMouseButton_Right = 1,
        ImGuiMouseButton_Middle = 2,
        ImGuiMouseButton_COUNT = 5,
    }
    enum ImGuiMouseButton_Left = _Anonymous_33.ImGuiMouseButton_Left;
    enum ImGuiMouseButton_Right = _Anonymous_33.ImGuiMouseButton_Right;
    enum ImGuiMouseButton_Middle = _Anonymous_33.ImGuiMouseButton_Middle;
    enum ImGuiMouseButton_COUNT = _Anonymous_33.ImGuiMouseButton_COUNT;
    alias ImGuiMouseCursor_ = _Anonymous_34;
    enum _Anonymous_34
    {
        ImGuiMouseCursor_None = -1,
        ImGuiMouseCursor_Arrow = 0,
        ImGuiMouseCursor_TextInput = 1,
        ImGuiMouseCursor_ResizeAll = 2,
        ImGuiMouseCursor_ResizeNS = 3,
        ImGuiMouseCursor_ResizeEW = 4,
        ImGuiMouseCursor_ResizeNESW = 5,
        ImGuiMouseCursor_ResizeNWSE = 6,
        ImGuiMouseCursor_Hand = 7,
        ImGuiMouseCursor_NotAllowed = 8,
        ImGuiMouseCursor_COUNT = 9,
    }
    enum ImGuiMouseCursor_None = _Anonymous_34.ImGuiMouseCursor_None;
    enum ImGuiMouseCursor_Arrow = _Anonymous_34.ImGuiMouseCursor_Arrow;
    enum ImGuiMouseCursor_TextInput = _Anonymous_34.ImGuiMouseCursor_TextInput;
    enum ImGuiMouseCursor_ResizeAll = _Anonymous_34.ImGuiMouseCursor_ResizeAll;
    enum ImGuiMouseCursor_ResizeNS = _Anonymous_34.ImGuiMouseCursor_ResizeNS;
    enum ImGuiMouseCursor_ResizeEW = _Anonymous_34.ImGuiMouseCursor_ResizeEW;
    enum ImGuiMouseCursor_ResizeNESW = _Anonymous_34.ImGuiMouseCursor_ResizeNESW;
    enum ImGuiMouseCursor_ResizeNWSE = _Anonymous_34.ImGuiMouseCursor_ResizeNWSE;
    enum ImGuiMouseCursor_Hand = _Anonymous_34.ImGuiMouseCursor_Hand;
    enum ImGuiMouseCursor_NotAllowed = _Anonymous_34.ImGuiMouseCursor_NotAllowed;
    enum ImGuiMouseCursor_COUNT = _Anonymous_34.ImGuiMouseCursor_COUNT;
    alias ImGuiCond_ = _Anonymous_35;
    enum _Anonymous_35
    {
        ImGuiCond_None = 0,
        ImGuiCond_Always = 1,
        ImGuiCond_Once = 2,
        ImGuiCond_FirstUseEver = 4,
        ImGuiCond_Appearing = 8,
    }
    enum ImGuiCond_None = _Anonymous_35.ImGuiCond_None;
    enum ImGuiCond_Always = _Anonymous_35.ImGuiCond_Always;
    enum ImGuiCond_Once = _Anonymous_35.ImGuiCond_Once;
    enum ImGuiCond_FirstUseEver = _Anonymous_35.ImGuiCond_FirstUseEver;
    enum ImGuiCond_Appearing = _Anonymous_35.ImGuiCond_Appearing;
    struct ImVector_ImGuiTabBar
    {
        int Size;
        int Capacity;
        ImGuiTabBar* Data;
    }
    struct ImPool_ImGuiTabBar
    {
        ImVector_ImGuiTabBar Buf;
        ImGuiStorage Map;
        int FreeIdx;
    }
    struct ImVector_ImGuiTable
    {
        int Size;
        int Capacity;
        ImGuiTable* Data;
    }
    struct ImPool_ImGuiTable
    {
        ImVector_ImGuiTable Buf;
        ImGuiStorage Map;
        int FreeIdx;
    }
    alias ImDrawFlags_ = _Anonymous_36;
    enum _Anonymous_36
    {
        ImDrawFlags_None = 0,
        ImDrawFlags_Closed = 1,
        ImDrawFlags_RoundCornersTopLeft = 16,
        ImDrawFlags_RoundCornersTopRight = 32,
        ImDrawFlags_RoundCornersBottomLeft = 64,
        ImDrawFlags_RoundCornersBottomRight = 128,
        ImDrawFlags_RoundCornersNone = 256,
        ImDrawFlags_RoundCornersTop = 48,
        ImDrawFlags_RoundCornersBottom = 192,
        ImDrawFlags_RoundCornersLeft = 80,
        ImDrawFlags_RoundCornersRight = 160,
        ImDrawFlags_RoundCornersAll = 240,
        ImDrawFlags_RoundCornersDefault_ = 240,
        ImDrawFlags_RoundCornersMask_ = 496,
    }
    enum ImDrawFlags_None = _Anonymous_36.ImDrawFlags_None;
    enum ImDrawFlags_Closed = _Anonymous_36.ImDrawFlags_Closed;
    enum ImDrawFlags_RoundCornersTopLeft = _Anonymous_36.ImDrawFlags_RoundCornersTopLeft;
    enum ImDrawFlags_RoundCornersTopRight = _Anonymous_36.ImDrawFlags_RoundCornersTopRight;
    enum ImDrawFlags_RoundCornersBottomLeft = _Anonymous_36.ImDrawFlags_RoundCornersBottomLeft;
    enum ImDrawFlags_RoundCornersBottomRight = _Anonymous_36.ImDrawFlags_RoundCornersBottomRight;
    enum ImDrawFlags_RoundCornersNone = _Anonymous_36.ImDrawFlags_RoundCornersNone;
    enum ImDrawFlags_RoundCornersTop = _Anonymous_36.ImDrawFlags_RoundCornersTop;
    enum ImDrawFlags_RoundCornersBottom = _Anonymous_36.ImDrawFlags_RoundCornersBottom;
    enum ImDrawFlags_RoundCornersLeft = _Anonymous_36.ImDrawFlags_RoundCornersLeft;
    enum ImDrawFlags_RoundCornersRight = _Anonymous_36.ImDrawFlags_RoundCornersRight;
    enum ImDrawFlags_RoundCornersAll = _Anonymous_36.ImDrawFlags_RoundCornersAll;
    enum ImDrawFlags_RoundCornersDefault_ = _Anonymous_36.ImDrawFlags_RoundCornersDefault_;
    enum ImDrawFlags_RoundCornersMask_ = _Anonymous_36.ImDrawFlags_RoundCornersMask_;
    alias ImDrawListFlags_ = _Anonymous_37;
    enum _Anonymous_37
    {
        ImDrawListFlags_None = 0,
        ImDrawListFlags_AntiAliasedLines = 1,
        ImDrawListFlags_AntiAliasedLinesUseTex = 2,
        ImDrawListFlags_AntiAliasedFill = 4,
        ImDrawListFlags_AllowVtxOffset = 8,
    }
    enum ImDrawListFlags_None = _Anonymous_37.ImDrawListFlags_None;
    enum ImDrawListFlags_AntiAliasedLines = _Anonymous_37.ImDrawListFlags_AntiAliasedLines;
    enum ImDrawListFlags_AntiAliasedLinesUseTex = _Anonymous_37.ImDrawListFlags_AntiAliasedLinesUseTex;
    enum ImDrawListFlags_AntiAliasedFill = _Anonymous_37.ImDrawListFlags_AntiAliasedFill;
    enum ImDrawListFlags_AllowVtxOffset = _Anonymous_37.ImDrawListFlags_AllowVtxOffset;
    alias ImFontAtlasFlags_ = _Anonymous_38;
    enum _Anonymous_38
    {
        ImFontAtlasFlags_None = 0,
        ImFontAtlasFlags_NoPowerOfTwoHeight = 1,
        ImFontAtlasFlags_NoMouseCursors = 2,
        ImFontAtlasFlags_NoBakedLines = 4,
    }
    enum ImFontAtlasFlags_None = _Anonymous_38.ImFontAtlasFlags_None;
    enum ImFontAtlasFlags_NoPowerOfTwoHeight = _Anonymous_38.ImFontAtlasFlags_NoPowerOfTwoHeight;
    enum ImFontAtlasFlags_NoMouseCursors = _Anonymous_38.ImFontAtlasFlags_NoMouseCursors;
    enum ImFontAtlasFlags_NoBakedLines = _Anonymous_38.ImFontAtlasFlags_NoBakedLines;
    alias ImGuiViewportFlags_ = _Anonymous_39;
    enum _Anonymous_39
    {
        ImGuiViewportFlags_None = 0,
        ImGuiViewportFlags_IsPlatformWindow = 1,
        ImGuiViewportFlags_IsPlatformMonitor = 2,
        ImGuiViewportFlags_OwnedByApp = 4,
        ImGuiViewportFlags_NoDecoration = 8,
        ImGuiViewportFlags_NoTaskBarIcon = 16,
        ImGuiViewportFlags_NoFocusOnAppearing = 32,
        ImGuiViewportFlags_NoFocusOnClick = 64,
        ImGuiViewportFlags_NoInputs = 128,
        ImGuiViewportFlags_NoRendererClear = 256,
        ImGuiViewportFlags_TopMost = 512,
        ImGuiViewportFlags_Minimized = 1024,
        ImGuiViewportFlags_NoAutoMerge = 2048,
        ImGuiViewportFlags_CanHostOtherWindows = 4096,
    }
    enum ImGuiViewportFlags_None = _Anonymous_39.ImGuiViewportFlags_None;
    enum ImGuiViewportFlags_IsPlatformWindow = _Anonymous_39.ImGuiViewportFlags_IsPlatformWindow;
    enum ImGuiViewportFlags_IsPlatformMonitor = _Anonymous_39.ImGuiViewportFlags_IsPlatformMonitor;
    enum ImGuiViewportFlags_OwnedByApp = _Anonymous_39.ImGuiViewportFlags_OwnedByApp;
    enum ImGuiViewportFlags_NoDecoration = _Anonymous_39.ImGuiViewportFlags_NoDecoration;
    enum ImGuiViewportFlags_NoTaskBarIcon = _Anonymous_39.ImGuiViewportFlags_NoTaskBarIcon;
    enum ImGuiViewportFlags_NoFocusOnAppearing = _Anonymous_39.ImGuiViewportFlags_NoFocusOnAppearing;
    enum ImGuiViewportFlags_NoFocusOnClick = _Anonymous_39.ImGuiViewportFlags_NoFocusOnClick;
    enum ImGuiViewportFlags_NoInputs = _Anonymous_39.ImGuiViewportFlags_NoInputs;
    enum ImGuiViewportFlags_NoRendererClear = _Anonymous_39.ImGuiViewportFlags_NoRendererClear;
    enum ImGuiViewportFlags_TopMost = _Anonymous_39.ImGuiViewportFlags_TopMost;
    enum ImGuiViewportFlags_Minimized = _Anonymous_39.ImGuiViewportFlags_Minimized;
    enum ImGuiViewportFlags_NoAutoMerge = _Anonymous_39.ImGuiViewportFlags_NoAutoMerge;
    enum ImGuiViewportFlags_CanHostOtherWindows = _Anonymous_39.ImGuiViewportFlags_CanHostOtherWindows;
    alias ImGuiItemFlags_ = _Anonymous_40;
    enum _Anonymous_40
    {
        ImGuiItemFlags_None = 0,
        ImGuiItemFlags_NoTabStop = 1,
        ImGuiItemFlags_ButtonRepeat = 2,
        ImGuiItemFlags_Disabled = 4,
        ImGuiItemFlags_NoNav = 8,
        ImGuiItemFlags_NoNavDefaultFocus = 16,
        ImGuiItemFlags_SelectableDontClosePopup = 32,
        ImGuiItemFlags_MixedValue = 64,
        ImGuiItemFlags_ReadOnly = 128,
    }
    enum ImGuiItemFlags_None = _Anonymous_40.ImGuiItemFlags_None;
    enum ImGuiItemFlags_NoTabStop = _Anonymous_40.ImGuiItemFlags_NoTabStop;
    enum ImGuiItemFlags_ButtonRepeat = _Anonymous_40.ImGuiItemFlags_ButtonRepeat;
    enum ImGuiItemFlags_Disabled = _Anonymous_40.ImGuiItemFlags_Disabled;
    enum ImGuiItemFlags_NoNav = _Anonymous_40.ImGuiItemFlags_NoNav;
    enum ImGuiItemFlags_NoNavDefaultFocus = _Anonymous_40.ImGuiItemFlags_NoNavDefaultFocus;
    enum ImGuiItemFlags_SelectableDontClosePopup = _Anonymous_40.ImGuiItemFlags_SelectableDontClosePopup;
    enum ImGuiItemFlags_MixedValue = _Anonymous_40.ImGuiItemFlags_MixedValue;
    enum ImGuiItemFlags_ReadOnly = _Anonymous_40.ImGuiItemFlags_ReadOnly;
    alias ImGuiItemAddFlags_ = _Anonymous_41;
    enum _Anonymous_41
    {
        ImGuiItemAddFlags_None = 0,
        ImGuiItemAddFlags_Focusable = 1,
    }
    enum ImGuiItemAddFlags_None = _Anonymous_41.ImGuiItemAddFlags_None;
    enum ImGuiItemAddFlags_Focusable = _Anonymous_41.ImGuiItemAddFlags_Focusable;
    alias ImGuiItemStatusFlags_ = _Anonymous_42;
    enum _Anonymous_42
    {
        ImGuiItemStatusFlags_None = 0,
        ImGuiItemStatusFlags_HoveredRect = 1,
        ImGuiItemStatusFlags_HasDisplayRect = 2,
        ImGuiItemStatusFlags_Edited = 4,
        ImGuiItemStatusFlags_ToggledSelection = 8,
        ImGuiItemStatusFlags_ToggledOpen = 16,
        ImGuiItemStatusFlags_HasDeactivated = 32,
        ImGuiItemStatusFlags_Deactivated = 64,
        ImGuiItemStatusFlags_HoveredWindow = 128,
        ImGuiItemStatusFlags_FocusedByCode = 256,
        ImGuiItemStatusFlags_FocusedByTabbing = 512,
        ImGuiItemStatusFlags_Focused = 768,
    }
    enum ImGuiItemStatusFlags_None = _Anonymous_42.ImGuiItemStatusFlags_None;
    enum ImGuiItemStatusFlags_HoveredRect = _Anonymous_42.ImGuiItemStatusFlags_HoveredRect;
    enum ImGuiItemStatusFlags_HasDisplayRect = _Anonymous_42.ImGuiItemStatusFlags_HasDisplayRect;
    enum ImGuiItemStatusFlags_Edited = _Anonymous_42.ImGuiItemStatusFlags_Edited;
    enum ImGuiItemStatusFlags_ToggledSelection = _Anonymous_42.ImGuiItemStatusFlags_ToggledSelection;
    enum ImGuiItemStatusFlags_ToggledOpen = _Anonymous_42.ImGuiItemStatusFlags_ToggledOpen;
    enum ImGuiItemStatusFlags_HasDeactivated = _Anonymous_42.ImGuiItemStatusFlags_HasDeactivated;
    enum ImGuiItemStatusFlags_Deactivated = _Anonymous_42.ImGuiItemStatusFlags_Deactivated;
    enum ImGuiItemStatusFlags_HoveredWindow = _Anonymous_42.ImGuiItemStatusFlags_HoveredWindow;
    enum ImGuiItemStatusFlags_FocusedByCode = _Anonymous_42.ImGuiItemStatusFlags_FocusedByCode;
    enum ImGuiItemStatusFlags_FocusedByTabbing = _Anonymous_42.ImGuiItemStatusFlags_FocusedByTabbing;
    enum ImGuiItemStatusFlags_Focused = _Anonymous_42.ImGuiItemStatusFlags_Focused;
    alias ImGuiInputTextFlagsPrivate_ = _Anonymous_43;
    enum _Anonymous_43
    {
        ImGuiInputTextFlags_Multiline = 67108864,
        ImGuiInputTextFlags_NoMarkEdited = 134217728,
        ImGuiInputTextFlags_MergedItem = 268435456,
    }
    enum ImGuiInputTextFlags_Multiline = _Anonymous_43.ImGuiInputTextFlags_Multiline;
    enum ImGuiInputTextFlags_NoMarkEdited = _Anonymous_43.ImGuiInputTextFlags_NoMarkEdited;
    enum ImGuiInputTextFlags_MergedItem = _Anonymous_43.ImGuiInputTextFlags_MergedItem;
    alias ImGuiButtonFlagsPrivate_ = _Anonymous_44;
    enum _Anonymous_44
    {
        ImGuiButtonFlags_PressedOnClick = 16,
        ImGuiButtonFlags_PressedOnClickRelease = 32,
        ImGuiButtonFlags_PressedOnClickReleaseAnywhere = 64,
        ImGuiButtonFlags_PressedOnRelease = 128,
        ImGuiButtonFlags_PressedOnDoubleClick = 256,
        ImGuiButtonFlags_PressedOnDragDropHold = 512,
        ImGuiButtonFlags_Repeat = 1024,
        ImGuiButtonFlags_FlattenChildren = 2048,
        ImGuiButtonFlags_AllowItemOverlap = 4096,
        ImGuiButtonFlags_DontClosePopups = 8192,
        ImGuiButtonFlags_AlignTextBaseLine = 32768,
        ImGuiButtonFlags_NoKeyModifiers = 65536,
        ImGuiButtonFlags_NoHoldingActiveId = 131072,
        ImGuiButtonFlags_NoNavFocus = 262144,
        ImGuiButtonFlags_NoHoveredOnFocus = 524288,
        ImGuiButtonFlags_PressedOnMask_ = 1008,
        ImGuiButtonFlags_PressedOnDefault_ = 32,
    }
    enum ImGuiButtonFlags_PressedOnClick = _Anonymous_44.ImGuiButtonFlags_PressedOnClick;
    enum ImGuiButtonFlags_PressedOnClickRelease = _Anonymous_44.ImGuiButtonFlags_PressedOnClickRelease;
    enum ImGuiButtonFlags_PressedOnClickReleaseAnywhere = _Anonymous_44.ImGuiButtonFlags_PressedOnClickReleaseAnywhere;
    enum ImGuiButtonFlags_PressedOnRelease = _Anonymous_44.ImGuiButtonFlags_PressedOnRelease;
    enum ImGuiButtonFlags_PressedOnDoubleClick = _Anonymous_44.ImGuiButtonFlags_PressedOnDoubleClick;
    enum ImGuiButtonFlags_PressedOnDragDropHold = _Anonymous_44.ImGuiButtonFlags_PressedOnDragDropHold;
    enum ImGuiButtonFlags_Repeat = _Anonymous_44.ImGuiButtonFlags_Repeat;
    enum ImGuiButtonFlags_FlattenChildren = _Anonymous_44.ImGuiButtonFlags_FlattenChildren;
    enum ImGuiButtonFlags_AllowItemOverlap = _Anonymous_44.ImGuiButtonFlags_AllowItemOverlap;
    enum ImGuiButtonFlags_DontClosePopups = _Anonymous_44.ImGuiButtonFlags_DontClosePopups;
    enum ImGuiButtonFlags_AlignTextBaseLine = _Anonymous_44.ImGuiButtonFlags_AlignTextBaseLine;
    enum ImGuiButtonFlags_NoKeyModifiers = _Anonymous_44.ImGuiButtonFlags_NoKeyModifiers;
    enum ImGuiButtonFlags_NoHoldingActiveId = _Anonymous_44.ImGuiButtonFlags_NoHoldingActiveId;
    enum ImGuiButtonFlags_NoNavFocus = _Anonymous_44.ImGuiButtonFlags_NoNavFocus;
    enum ImGuiButtonFlags_NoHoveredOnFocus = _Anonymous_44.ImGuiButtonFlags_NoHoveredOnFocus;
    enum ImGuiButtonFlags_PressedOnMask_ = _Anonymous_44.ImGuiButtonFlags_PressedOnMask_;
    enum ImGuiButtonFlags_PressedOnDefault_ = _Anonymous_44.ImGuiButtonFlags_PressedOnDefault_;
    alias ImGuiComboFlagsPrivate_ = _Anonymous_45;
    enum _Anonymous_45
    {
        ImGuiComboFlags_CustomPreview = 1048576,
    }
    enum ImGuiComboFlags_CustomPreview = _Anonymous_45.ImGuiComboFlags_CustomPreview;
    alias ImGuiSliderFlagsPrivate_ = _Anonymous_46;
    enum _Anonymous_46
    {
        ImGuiSliderFlags_Vertical = 1048576,
        ImGuiSliderFlags_ReadOnly = 2097152,
    }
    enum ImGuiSliderFlags_Vertical = _Anonymous_46.ImGuiSliderFlags_Vertical;
    enum ImGuiSliderFlags_ReadOnly = _Anonymous_46.ImGuiSliderFlags_ReadOnly;
    alias ImGuiSelectableFlagsPrivate_ = _Anonymous_47;
    enum _Anonymous_47
    {
        ImGuiSelectableFlags_NoHoldingActiveID = 1048576,
        ImGuiSelectableFlags_SelectOnNav = 2097152,
        ImGuiSelectableFlags_SelectOnClick = 4194304,
        ImGuiSelectableFlags_SelectOnRelease = 8388608,
        ImGuiSelectableFlags_SpanAvailWidth = 16777216,
        ImGuiSelectableFlags_DrawHoveredWhenHeld = 33554432,
        ImGuiSelectableFlags_SetNavIdOnHover = 67108864,
        ImGuiSelectableFlags_NoPadWithHalfSpacing = 134217728,
    }
    enum ImGuiSelectableFlags_NoHoldingActiveID = _Anonymous_47.ImGuiSelectableFlags_NoHoldingActiveID;
    enum ImGuiSelectableFlags_SelectOnNav = _Anonymous_47.ImGuiSelectableFlags_SelectOnNav;
    enum ImGuiSelectableFlags_SelectOnClick = _Anonymous_47.ImGuiSelectableFlags_SelectOnClick;
    enum ImGuiSelectableFlags_SelectOnRelease = _Anonymous_47.ImGuiSelectableFlags_SelectOnRelease;
    enum ImGuiSelectableFlags_SpanAvailWidth = _Anonymous_47.ImGuiSelectableFlags_SpanAvailWidth;
    enum ImGuiSelectableFlags_DrawHoveredWhenHeld = _Anonymous_47.ImGuiSelectableFlags_DrawHoveredWhenHeld;
    enum ImGuiSelectableFlags_SetNavIdOnHover = _Anonymous_47.ImGuiSelectableFlags_SetNavIdOnHover;
    enum ImGuiSelectableFlags_NoPadWithHalfSpacing = _Anonymous_47.ImGuiSelectableFlags_NoPadWithHalfSpacing;
    alias ImGuiTreeNodeFlagsPrivate_ = _Anonymous_48;
    enum _Anonymous_48
    {
        ImGuiTreeNodeFlags_ClipLabelForTrailingButton = 1048576,
    }
    enum ImGuiTreeNodeFlags_ClipLabelForTrailingButton = _Anonymous_48.ImGuiTreeNodeFlags_ClipLabelForTrailingButton;
    alias ImGuiSeparatorFlags_ = _Anonymous_49;
    enum _Anonymous_49
    {
        ImGuiSeparatorFlags_None = 0,
        ImGuiSeparatorFlags_Horizontal = 1,
        ImGuiSeparatorFlags_Vertical = 2,
        ImGuiSeparatorFlags_SpanAllColumns = 4,
    }
    enum ImGuiSeparatorFlags_None = _Anonymous_49.ImGuiSeparatorFlags_None;
    enum ImGuiSeparatorFlags_Horizontal = _Anonymous_49.ImGuiSeparatorFlags_Horizontal;
    enum ImGuiSeparatorFlags_Vertical = _Anonymous_49.ImGuiSeparatorFlags_Vertical;
    enum ImGuiSeparatorFlags_SpanAllColumns = _Anonymous_49.ImGuiSeparatorFlags_SpanAllColumns;
    alias ImGuiTextFlags_ = _Anonymous_50;
    enum _Anonymous_50
    {
        ImGuiTextFlags_None = 0,
        ImGuiTextFlags_NoWidthForLargeClippedText = 1,
    }
    enum ImGuiTextFlags_None = _Anonymous_50.ImGuiTextFlags_None;
    enum ImGuiTextFlags_NoWidthForLargeClippedText = _Anonymous_50.ImGuiTextFlags_NoWidthForLargeClippedText;
    alias ImGuiTooltipFlags_ = _Anonymous_51;
    enum _Anonymous_51
    {
        ImGuiTooltipFlags_None = 0,
        ImGuiTooltipFlags_OverridePreviousTooltip = 1,
    }
    enum ImGuiTooltipFlags_None = _Anonymous_51.ImGuiTooltipFlags_None;
    enum ImGuiTooltipFlags_OverridePreviousTooltip = _Anonymous_51.ImGuiTooltipFlags_OverridePreviousTooltip;
    alias ImGuiLayoutType_ = _Anonymous_52;
    enum _Anonymous_52
    {
        ImGuiLayoutType_Horizontal = 0,
        ImGuiLayoutType_Vertical = 1,
    }
    enum ImGuiLayoutType_Horizontal = _Anonymous_52.ImGuiLayoutType_Horizontal;
    enum ImGuiLayoutType_Vertical = _Anonymous_52.ImGuiLayoutType_Vertical;
    alias ImGuiLogType = _Anonymous_53;
    enum _Anonymous_53
    {
        ImGuiLogType_None = 0,
        ImGuiLogType_TTY = 1,
        ImGuiLogType_File = 2,
        ImGuiLogType_Buffer = 3,
        ImGuiLogType_Clipboard = 4,
    }
    enum ImGuiLogType_None = _Anonymous_53.ImGuiLogType_None;
    enum ImGuiLogType_TTY = _Anonymous_53.ImGuiLogType_TTY;
    enum ImGuiLogType_File = _Anonymous_53.ImGuiLogType_File;
    enum ImGuiLogType_Buffer = _Anonymous_53.ImGuiLogType_Buffer;
    enum ImGuiLogType_Clipboard = _Anonymous_53.ImGuiLogType_Clipboard;
    alias ImGuiAxis = _Anonymous_54;
    enum _Anonymous_54
    {
        ImGuiAxis_None = -1,
        ImGuiAxis_X = 0,
        ImGuiAxis_Y = 1,
    }
    enum ImGuiAxis_None = _Anonymous_54.ImGuiAxis_None;
    enum ImGuiAxis_X = _Anonymous_54.ImGuiAxis_X;
    enum ImGuiAxis_Y = _Anonymous_54.ImGuiAxis_Y;
    alias ImGuiPlotType = _Anonymous_55;
    enum _Anonymous_55
    {
        ImGuiPlotType_Lines = 0,
        ImGuiPlotType_Histogram = 1,
    }
    enum ImGuiPlotType_Lines = _Anonymous_55.ImGuiPlotType_Lines;
    enum ImGuiPlotType_Histogram = _Anonymous_55.ImGuiPlotType_Histogram;
    alias ImGuiInputSource = _Anonymous_56;
    enum _Anonymous_56
    {
        ImGuiInputSource_None = 0,
        ImGuiInputSource_Mouse = 1,
        ImGuiInputSource_Keyboard = 2,
        ImGuiInputSource_Gamepad = 3,
        ImGuiInputSource_Nav = 4,
        ImGuiInputSource_Clipboard = 5,
        ImGuiInputSource_COUNT = 6,
    }
    enum ImGuiInputSource_None = _Anonymous_56.ImGuiInputSource_None;
    enum ImGuiInputSource_Mouse = _Anonymous_56.ImGuiInputSource_Mouse;
    enum ImGuiInputSource_Keyboard = _Anonymous_56.ImGuiInputSource_Keyboard;
    enum ImGuiInputSource_Gamepad = _Anonymous_56.ImGuiInputSource_Gamepad;
    enum ImGuiInputSource_Nav = _Anonymous_56.ImGuiInputSource_Nav;
    enum ImGuiInputSource_Clipboard = _Anonymous_56.ImGuiInputSource_Clipboard;
    enum ImGuiInputSource_COUNT = _Anonymous_56.ImGuiInputSource_COUNT;
    alias ImGuiInputReadMode = _Anonymous_57;
    enum _Anonymous_57
    {
        ImGuiInputReadMode_Down = 0,
        ImGuiInputReadMode_Pressed = 1,
        ImGuiInputReadMode_Released = 2,
        ImGuiInputReadMode_Repeat = 3,
        ImGuiInputReadMode_RepeatSlow = 4,
        ImGuiInputReadMode_RepeatFast = 5,
    }
    enum ImGuiInputReadMode_Down = _Anonymous_57.ImGuiInputReadMode_Down;
    enum ImGuiInputReadMode_Pressed = _Anonymous_57.ImGuiInputReadMode_Pressed;
    enum ImGuiInputReadMode_Released = _Anonymous_57.ImGuiInputReadMode_Released;
    enum ImGuiInputReadMode_Repeat = _Anonymous_57.ImGuiInputReadMode_Repeat;
    enum ImGuiInputReadMode_RepeatSlow = _Anonymous_57.ImGuiInputReadMode_RepeatSlow;
    enum ImGuiInputReadMode_RepeatFast = _Anonymous_57.ImGuiInputReadMode_RepeatFast;
    alias ImGuiNavHighlightFlags_ = _Anonymous_58;
    enum _Anonymous_58
    {
        ImGuiNavHighlightFlags_None = 0,
        ImGuiNavHighlightFlags_TypeDefault = 1,
        ImGuiNavHighlightFlags_TypeThin = 2,
        ImGuiNavHighlightFlags_AlwaysDraw = 4,
        ImGuiNavHighlightFlags_NoRounding = 8,
    }
    enum ImGuiNavHighlightFlags_None = _Anonymous_58.ImGuiNavHighlightFlags_None;
    enum ImGuiNavHighlightFlags_TypeDefault = _Anonymous_58.ImGuiNavHighlightFlags_TypeDefault;
    enum ImGuiNavHighlightFlags_TypeThin = _Anonymous_58.ImGuiNavHighlightFlags_TypeThin;
    enum ImGuiNavHighlightFlags_AlwaysDraw = _Anonymous_58.ImGuiNavHighlightFlags_AlwaysDraw;
    enum ImGuiNavHighlightFlags_NoRounding = _Anonymous_58.ImGuiNavHighlightFlags_NoRounding;
    alias ImGuiNavDirSourceFlags_ = _Anonymous_59;
    enum _Anonymous_59
    {
        ImGuiNavDirSourceFlags_None = 0,
        ImGuiNavDirSourceFlags_Keyboard = 1,
        ImGuiNavDirSourceFlags_PadDPad = 2,
        ImGuiNavDirSourceFlags_PadLStick = 4,
    }
    enum ImGuiNavDirSourceFlags_None = _Anonymous_59.ImGuiNavDirSourceFlags_None;
    enum ImGuiNavDirSourceFlags_Keyboard = _Anonymous_59.ImGuiNavDirSourceFlags_Keyboard;
    enum ImGuiNavDirSourceFlags_PadDPad = _Anonymous_59.ImGuiNavDirSourceFlags_PadDPad;
    enum ImGuiNavDirSourceFlags_PadLStick = _Anonymous_59.ImGuiNavDirSourceFlags_PadLStick;
    alias ImGuiNavMoveFlags_ = _Anonymous_60;
    enum _Anonymous_60
    {
        ImGuiNavMoveFlags_None = 0,
        ImGuiNavMoveFlags_LoopX = 1,
        ImGuiNavMoveFlags_LoopY = 2,
        ImGuiNavMoveFlags_WrapX = 4,
        ImGuiNavMoveFlags_WrapY = 8,
        ImGuiNavMoveFlags_AllowCurrentNavId = 16,
        ImGuiNavMoveFlags_AlsoScoreVisibleSet = 32,
        ImGuiNavMoveFlags_ScrollToEdge = 64,
    }
    enum ImGuiNavMoveFlags_None = _Anonymous_60.ImGuiNavMoveFlags_None;
    enum ImGuiNavMoveFlags_LoopX = _Anonymous_60.ImGuiNavMoveFlags_LoopX;
    enum ImGuiNavMoveFlags_LoopY = _Anonymous_60.ImGuiNavMoveFlags_LoopY;
    enum ImGuiNavMoveFlags_WrapX = _Anonymous_60.ImGuiNavMoveFlags_WrapX;
    enum ImGuiNavMoveFlags_WrapY = _Anonymous_60.ImGuiNavMoveFlags_WrapY;
    enum ImGuiNavMoveFlags_AllowCurrentNavId = _Anonymous_60.ImGuiNavMoveFlags_AllowCurrentNavId;
    enum ImGuiNavMoveFlags_AlsoScoreVisibleSet = _Anonymous_60.ImGuiNavMoveFlags_AlsoScoreVisibleSet;
    enum ImGuiNavMoveFlags_ScrollToEdge = _Anonymous_60.ImGuiNavMoveFlags_ScrollToEdge;
    alias ImGuiNavForward = _Anonymous_61;
    enum _Anonymous_61
    {
        ImGuiNavForward_None = 0,
        ImGuiNavForward_ForwardQueued = 1,
        ImGuiNavForward_ForwardActive = 2,
    }
    enum ImGuiNavForward_None = _Anonymous_61.ImGuiNavForward_None;
    enum ImGuiNavForward_ForwardQueued = _Anonymous_61.ImGuiNavForward_ForwardQueued;
    enum ImGuiNavForward_ForwardActive = _Anonymous_61.ImGuiNavForward_ForwardActive;
    alias ImGuiNavLayer = _Anonymous_62;
    enum _Anonymous_62
    {
        ImGuiNavLayer_Main = 0,
        ImGuiNavLayer_Menu = 1,
        ImGuiNavLayer_COUNT = 2,
    }
    enum ImGuiNavLayer_Main = _Anonymous_62.ImGuiNavLayer_Main;
    enum ImGuiNavLayer_Menu = _Anonymous_62.ImGuiNavLayer_Menu;
    enum ImGuiNavLayer_COUNT = _Anonymous_62.ImGuiNavLayer_COUNT;
    alias ImGuiPopupPositionPolicy = _Anonymous_63;
    enum _Anonymous_63
    {
        ImGuiPopupPositionPolicy_Default = 0,
        ImGuiPopupPositionPolicy_ComboBox = 1,
        ImGuiPopupPositionPolicy_Tooltip = 2,
    }
    enum ImGuiPopupPositionPolicy_Default = _Anonymous_63.ImGuiPopupPositionPolicy_Default;
    enum ImGuiPopupPositionPolicy_ComboBox = _Anonymous_63.ImGuiPopupPositionPolicy_ComboBox;
    enum ImGuiPopupPositionPolicy_Tooltip = _Anonymous_63.ImGuiPopupPositionPolicy_Tooltip;
    alias ImGuiDataTypePrivate_ = _Anonymous_64;
    enum _Anonymous_64
    {
        ImGuiDataType_String = 11,
        ImGuiDataType_Pointer = 12,
        ImGuiDataType_ID = 13,
    }
    enum ImGuiDataType_String = _Anonymous_64.ImGuiDataType_String;
    enum ImGuiDataType_Pointer = _Anonymous_64.ImGuiDataType_Pointer;
    enum ImGuiDataType_ID = _Anonymous_64.ImGuiDataType_ID;
    alias ImGuiNextWindowDataFlags_ = _Anonymous_65;
    enum _Anonymous_65
    {
        ImGuiNextWindowDataFlags_None = 0,
        ImGuiNextWindowDataFlags_HasPos = 1,
        ImGuiNextWindowDataFlags_HasSize = 2,
        ImGuiNextWindowDataFlags_HasContentSize = 4,
        ImGuiNextWindowDataFlags_HasCollapsed = 8,
        ImGuiNextWindowDataFlags_HasSizeConstraint = 16,
        ImGuiNextWindowDataFlags_HasFocus = 32,
        ImGuiNextWindowDataFlags_HasBgAlpha = 64,
        ImGuiNextWindowDataFlags_HasScroll = 128,
        ImGuiNextWindowDataFlags_HasViewport = 256,
        ImGuiNextWindowDataFlags_HasDock = 512,
        ImGuiNextWindowDataFlags_HasWindowClass = 1024,
    }
    enum ImGuiNextWindowDataFlags_None = _Anonymous_65.ImGuiNextWindowDataFlags_None;
    enum ImGuiNextWindowDataFlags_HasPos = _Anonymous_65.ImGuiNextWindowDataFlags_HasPos;
    enum ImGuiNextWindowDataFlags_HasSize = _Anonymous_65.ImGuiNextWindowDataFlags_HasSize;
    enum ImGuiNextWindowDataFlags_HasContentSize = _Anonymous_65.ImGuiNextWindowDataFlags_HasContentSize;
    enum ImGuiNextWindowDataFlags_HasCollapsed = _Anonymous_65.ImGuiNextWindowDataFlags_HasCollapsed;
    enum ImGuiNextWindowDataFlags_HasSizeConstraint = _Anonymous_65.ImGuiNextWindowDataFlags_HasSizeConstraint;
    enum ImGuiNextWindowDataFlags_HasFocus = _Anonymous_65.ImGuiNextWindowDataFlags_HasFocus;
    enum ImGuiNextWindowDataFlags_HasBgAlpha = _Anonymous_65.ImGuiNextWindowDataFlags_HasBgAlpha;
    enum ImGuiNextWindowDataFlags_HasScroll = _Anonymous_65.ImGuiNextWindowDataFlags_HasScroll;
    enum ImGuiNextWindowDataFlags_HasViewport = _Anonymous_65.ImGuiNextWindowDataFlags_HasViewport;
    enum ImGuiNextWindowDataFlags_HasDock = _Anonymous_65.ImGuiNextWindowDataFlags_HasDock;
    enum ImGuiNextWindowDataFlags_HasWindowClass = _Anonymous_65.ImGuiNextWindowDataFlags_HasWindowClass;
    alias ImGuiNextItemDataFlags_ = _Anonymous_66;
    enum _Anonymous_66
    {
        ImGuiNextItemDataFlags_None = 0,
        ImGuiNextItemDataFlags_HasWidth = 1,
        ImGuiNextItemDataFlags_HasOpen = 2,
    }
    enum ImGuiNextItemDataFlags_None = _Anonymous_66.ImGuiNextItemDataFlags_None;
    enum ImGuiNextItemDataFlags_HasWidth = _Anonymous_66.ImGuiNextItemDataFlags_HasWidth;
    enum ImGuiNextItemDataFlags_HasOpen = _Anonymous_66.ImGuiNextItemDataFlags_HasOpen;
    alias ImGuiOldColumnFlags_ = _Anonymous_67;
    enum _Anonymous_67
    {
        ImGuiOldColumnFlags_None = 0,
        ImGuiOldColumnFlags_NoBorder = 1,
        ImGuiOldColumnFlags_NoResize = 2,
        ImGuiOldColumnFlags_NoPreserveWidths = 4,
        ImGuiOldColumnFlags_NoForceWithinWindow = 8,
        ImGuiOldColumnFlags_GrowParentContentsSize = 16,
    }
    enum ImGuiOldColumnFlags_None = _Anonymous_67.ImGuiOldColumnFlags_None;
    enum ImGuiOldColumnFlags_NoBorder = _Anonymous_67.ImGuiOldColumnFlags_NoBorder;
    enum ImGuiOldColumnFlags_NoResize = _Anonymous_67.ImGuiOldColumnFlags_NoResize;
    enum ImGuiOldColumnFlags_NoPreserveWidths = _Anonymous_67.ImGuiOldColumnFlags_NoPreserveWidths;
    enum ImGuiOldColumnFlags_NoForceWithinWindow = _Anonymous_67.ImGuiOldColumnFlags_NoForceWithinWindow;
    enum ImGuiOldColumnFlags_GrowParentContentsSize = _Anonymous_67.ImGuiOldColumnFlags_GrowParentContentsSize;
    alias ImGuiDockNodeFlagsPrivate_ = _Anonymous_68;
    enum _Anonymous_68
    {
        ImGuiDockNodeFlags_DockSpace = 1024,
        ImGuiDockNodeFlags_CentralNode = 2048,
        ImGuiDockNodeFlags_NoTabBar = 4096,
        ImGuiDockNodeFlags_HiddenTabBar = 8192,
        ImGuiDockNodeFlags_NoWindowMenuButton = 16384,
        ImGuiDockNodeFlags_NoCloseButton = 32768,
        ImGuiDockNodeFlags_NoDocking = 65536,
        ImGuiDockNodeFlags_NoDockingSplitMe = 131072,
        ImGuiDockNodeFlags_NoDockingSplitOther = 262144,
        ImGuiDockNodeFlags_NoDockingOverMe = 524288,
        ImGuiDockNodeFlags_NoDockingOverOther = 1048576,
        ImGuiDockNodeFlags_NoDockingOverEmpty = 2097152,
        ImGuiDockNodeFlags_NoResizeX = 4194304,
        ImGuiDockNodeFlags_NoResizeY = 8388608,
        ImGuiDockNodeFlags_SharedFlagsInheritMask_ = -1,
        ImGuiDockNodeFlags_NoResizeFlagsMask_ = 12582944,
        ImGuiDockNodeFlags_LocalFlagsMask_ = 12713072,
        ImGuiDockNodeFlags_LocalFlagsTransferMask_ = 12712048,
        ImGuiDockNodeFlags_SavedFlagsMask_ = 12712992,
    }
    enum ImGuiDockNodeFlags_DockSpace = _Anonymous_68.ImGuiDockNodeFlags_DockSpace;
    enum ImGuiDockNodeFlags_CentralNode = _Anonymous_68.ImGuiDockNodeFlags_CentralNode;
    enum ImGuiDockNodeFlags_NoTabBar = _Anonymous_68.ImGuiDockNodeFlags_NoTabBar;
    enum ImGuiDockNodeFlags_HiddenTabBar = _Anonymous_68.ImGuiDockNodeFlags_HiddenTabBar;
    enum ImGuiDockNodeFlags_NoWindowMenuButton = _Anonymous_68.ImGuiDockNodeFlags_NoWindowMenuButton;
    enum ImGuiDockNodeFlags_NoCloseButton = _Anonymous_68.ImGuiDockNodeFlags_NoCloseButton;
    enum ImGuiDockNodeFlags_NoDocking = _Anonymous_68.ImGuiDockNodeFlags_NoDocking;
    enum ImGuiDockNodeFlags_NoDockingSplitMe = _Anonymous_68.ImGuiDockNodeFlags_NoDockingSplitMe;
    enum ImGuiDockNodeFlags_NoDockingSplitOther = _Anonymous_68.ImGuiDockNodeFlags_NoDockingSplitOther;
    enum ImGuiDockNodeFlags_NoDockingOverMe = _Anonymous_68.ImGuiDockNodeFlags_NoDockingOverMe;
    enum ImGuiDockNodeFlags_NoDockingOverOther = _Anonymous_68.ImGuiDockNodeFlags_NoDockingOverOther;
    enum ImGuiDockNodeFlags_NoDockingOverEmpty = _Anonymous_68.ImGuiDockNodeFlags_NoDockingOverEmpty;
    enum ImGuiDockNodeFlags_NoResizeX = _Anonymous_68.ImGuiDockNodeFlags_NoResizeX;
    enum ImGuiDockNodeFlags_NoResizeY = _Anonymous_68.ImGuiDockNodeFlags_NoResizeY;
    enum ImGuiDockNodeFlags_SharedFlagsInheritMask_ = _Anonymous_68.ImGuiDockNodeFlags_SharedFlagsInheritMask_;
    enum ImGuiDockNodeFlags_NoResizeFlagsMask_ = _Anonymous_68.ImGuiDockNodeFlags_NoResizeFlagsMask_;
    enum ImGuiDockNodeFlags_LocalFlagsMask_ = _Anonymous_68.ImGuiDockNodeFlags_LocalFlagsMask_;
    enum ImGuiDockNodeFlags_LocalFlagsTransferMask_ = _Anonymous_68.ImGuiDockNodeFlags_LocalFlagsTransferMask_;
    enum ImGuiDockNodeFlags_SavedFlagsMask_ = _Anonymous_68.ImGuiDockNodeFlags_SavedFlagsMask_;
    alias ImGuiDataAuthority_ = _Anonymous_69;
    enum _Anonymous_69
    {
        ImGuiDataAuthority_Auto = 0,
        ImGuiDataAuthority_DockNode = 1,
        ImGuiDataAuthority_Window = 2,
    }
    enum ImGuiDataAuthority_Auto = _Anonymous_69.ImGuiDataAuthority_Auto;
    enum ImGuiDataAuthority_DockNode = _Anonymous_69.ImGuiDataAuthority_DockNode;
    enum ImGuiDataAuthority_Window = _Anonymous_69.ImGuiDataAuthority_Window;
    alias ImGuiDockNodeState = _Anonymous_70;
    enum _Anonymous_70
    {
        ImGuiDockNodeState_Unknown = 0,
        ImGuiDockNodeState_HostWindowHiddenBecauseSingleWindow = 1,
        ImGuiDockNodeState_HostWindowHiddenBecauseWindowsAreResizing = 2,
        ImGuiDockNodeState_HostWindowVisible = 3,
    }
    enum ImGuiDockNodeState_Unknown = _Anonymous_70.ImGuiDockNodeState_Unknown;
    enum ImGuiDockNodeState_HostWindowHiddenBecauseSingleWindow = _Anonymous_70.ImGuiDockNodeState_HostWindowHiddenBecauseSingleWindow;
    enum ImGuiDockNodeState_HostWindowHiddenBecauseWindowsAreResizing = _Anonymous_70.ImGuiDockNodeState_HostWindowHiddenBecauseWindowsAreResizing;
    enum ImGuiDockNodeState_HostWindowVisible = _Anonymous_70.ImGuiDockNodeState_HostWindowVisible;
    alias ImGuiWindowDockStyleCol = _Anonymous_71;
    enum _Anonymous_71
    {
        ImGuiWindowDockStyleCol_Text = 0,
        ImGuiWindowDockStyleCol_Tab = 1,
        ImGuiWindowDockStyleCol_TabHovered = 2,
        ImGuiWindowDockStyleCol_TabActive = 3,
        ImGuiWindowDockStyleCol_TabUnfocused = 4,
        ImGuiWindowDockStyleCol_TabUnfocusedActive = 5,
        ImGuiWindowDockStyleCol_COUNT = 6,
    }
    enum ImGuiWindowDockStyleCol_Text = _Anonymous_71.ImGuiWindowDockStyleCol_Text;
    enum ImGuiWindowDockStyleCol_Tab = _Anonymous_71.ImGuiWindowDockStyleCol_Tab;
    enum ImGuiWindowDockStyleCol_TabHovered = _Anonymous_71.ImGuiWindowDockStyleCol_TabHovered;
    enum ImGuiWindowDockStyleCol_TabActive = _Anonymous_71.ImGuiWindowDockStyleCol_TabActive;
    enum ImGuiWindowDockStyleCol_TabUnfocused = _Anonymous_71.ImGuiWindowDockStyleCol_TabUnfocused;
    enum ImGuiWindowDockStyleCol_TabUnfocusedActive = _Anonymous_71.ImGuiWindowDockStyleCol_TabUnfocusedActive;
    enum ImGuiWindowDockStyleCol_COUNT = _Anonymous_71.ImGuiWindowDockStyleCol_COUNT;
    alias ImGuiContextHookType = _Anonymous_72;
    enum _Anonymous_72
    {
        ImGuiContextHookType_NewFramePre = 0,
        ImGuiContextHookType_NewFramePost = 1,
        ImGuiContextHookType_EndFramePre = 2,
        ImGuiContextHookType_EndFramePost = 3,
        ImGuiContextHookType_RenderPre = 4,
        ImGuiContextHookType_RenderPost = 5,
        ImGuiContextHookType_Shutdown = 6,
        ImGuiContextHookType_PendingRemoval_ = 7,
    }
    enum ImGuiContextHookType_NewFramePre = _Anonymous_72.ImGuiContextHookType_NewFramePre;
    enum ImGuiContextHookType_NewFramePost = _Anonymous_72.ImGuiContextHookType_NewFramePost;
    enum ImGuiContextHookType_EndFramePre = _Anonymous_72.ImGuiContextHookType_EndFramePre;
    enum ImGuiContextHookType_EndFramePost = _Anonymous_72.ImGuiContextHookType_EndFramePost;
    enum ImGuiContextHookType_RenderPre = _Anonymous_72.ImGuiContextHookType_RenderPre;
    enum ImGuiContextHookType_RenderPost = _Anonymous_72.ImGuiContextHookType_RenderPost;
    enum ImGuiContextHookType_Shutdown = _Anonymous_72.ImGuiContextHookType_Shutdown;
    enum ImGuiContextHookType_PendingRemoval_ = _Anonymous_72.ImGuiContextHookType_PendingRemoval_;
    alias ImGuiTabBarFlagsPrivate_ = _Anonymous_73;
    enum _Anonymous_73
    {
        ImGuiTabBarFlags_DockNode = 1048576,
        ImGuiTabBarFlags_IsFocused = 2097152,
        ImGuiTabBarFlags_SaveSettings = 4194304,
    }
    enum ImGuiTabBarFlags_DockNode = _Anonymous_73.ImGuiTabBarFlags_DockNode;
    enum ImGuiTabBarFlags_IsFocused = _Anonymous_73.ImGuiTabBarFlags_IsFocused;
    enum ImGuiTabBarFlags_SaveSettings = _Anonymous_73.ImGuiTabBarFlags_SaveSettings;
    alias ImGuiTabItemFlagsPrivate_ = _Anonymous_74;
    enum _Anonymous_74
    {
        ImGuiTabItemFlags_SectionMask_ = 192,
        ImGuiTabItemFlags_NoCloseButton = 1048576,
        ImGuiTabItemFlags_Button = 2097152,
        ImGuiTabItemFlags_Unsorted = 4194304,
        ImGuiTabItemFlags_Preview = 8388608,
    }
    enum ImGuiTabItemFlags_SectionMask_ = _Anonymous_74.ImGuiTabItemFlags_SectionMask_;
    enum ImGuiTabItemFlags_NoCloseButton = _Anonymous_74.ImGuiTabItemFlags_NoCloseButton;
    enum ImGuiTabItemFlags_Button = _Anonymous_74.ImGuiTabItemFlags_Button;
    enum ImGuiTabItemFlags_Unsorted = _Anonymous_74.ImGuiTabItemFlags_Unsorted;
    enum ImGuiTabItemFlags_Preview = _Anonymous_74.ImGuiTabItemFlags_Preview;



    static if(!is(typeof(IMGUI_HAS_DOCK))) {
        private enum enumMixinStr_IMGUI_HAS_DOCK = `enum IMGUI_HAS_DOCK = 1;`;
        static if(is(typeof({ mixin(enumMixinStr_IMGUI_HAS_DOCK); }))) {
            mixin(enumMixinStr_IMGUI_HAS_DOCK);
        }
    }




    static if(!is(typeof(CONST))) {
        private enum enumMixinStr_CONST = `enum CONST = const;`;
        static if(is(typeof({ mixin(enumMixinStr_CONST); }))) {
            mixin(enumMixinStr_CONST);
        }
    }




    static if(!is(typeof(CIMGUI_API))) {
        private enum enumMixinStr_CIMGUI_API = `enum CIMGUI_API = EXTERN API;`;
        static if(is(typeof({ mixin(enumMixinStr_CIMGUI_API); }))) {
            mixin(enumMixinStr_CIMGUI_API);
        }
    }




    static if(!is(typeof(EXTERN))) {
        private enum enumMixinStr_EXTERN = `enum EXTERN = extern "C";`;
        static if(is(typeof({ mixin(enumMixinStr_EXTERN); }))) {
            mixin(enumMixinStr_EXTERN);
        }
    }




    static if(!is(typeof(API))) {
        private enum enumMixinStr_API = `enum API = __declspec ( dllexport );`;
        static if(is(typeof({ mixin(enumMixinStr_API); }))) {
            mixin(enumMixinStr_API);
        }
    }
    static if(!is(typeof(SYS_OPEN))) {
        private enum enumMixinStr_SYS_OPEN = `enum SYS_OPEN = _SYS_OPEN;`;
        static if(is(typeof({ mixin(enumMixinStr_SYS_OPEN); }))) {
            mixin(enumMixinStr_SYS_OPEN);
        }
    }




    static if(!is(typeof(_commode))) {
        private enum enumMixinStr__commode = `enum _commode = ( * __p__commode ( ) );`;
        static if(is(typeof({ mixin(enumMixinStr__commode); }))) {
            mixin(enumMixinStr__commode);
        }
    }
    static if(!is(typeof(_TMP_MAX_S))) {
        private enum enumMixinStr__TMP_MAX_S = `enum _TMP_MAX_S = TMP_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr__TMP_MAX_S); }))) {
            mixin(enumMixinStr__TMP_MAX_S);
        }
    }




    static if(!is(typeof(TMP_MAX_S))) {
        private enum enumMixinStr_TMP_MAX_S = `enum TMP_MAX_S = TMP_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr_TMP_MAX_S); }))) {
            mixin(enumMixinStr_TMP_MAX_S);
        }
    }




    static if(!is(typeof(TMP_MAX))) {
        private enum enumMixinStr_TMP_MAX = `enum TMP_MAX = _CRT_INT_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr_TMP_MAX); }))) {
            mixin(enumMixinStr_TMP_MAX);
        }
    }




    static if(!is(typeof(_SYS_OPEN))) {
        private enum enumMixinStr__SYS_OPEN = `enum _SYS_OPEN = 20;`;
        static if(is(typeof({ mixin(enumMixinStr__SYS_OPEN); }))) {
            mixin(enumMixinStr__SYS_OPEN);
        }
    }




    static if(!is(typeof(FOPEN_MAX))) {
        private enum enumMixinStr_FOPEN_MAX = `enum FOPEN_MAX = 20;`;
        static if(is(typeof({ mixin(enumMixinStr_FOPEN_MAX); }))) {
            mixin(enumMixinStr_FOPEN_MAX);
        }
    }




    static if(!is(typeof(FILENAME_MAX))) {
        private enum enumMixinStr_FILENAME_MAX = `enum FILENAME_MAX = 260;`;
        static if(is(typeof({ mixin(enumMixinStr_FILENAME_MAX); }))) {
            mixin(enumMixinStr_FILENAME_MAX);
        }
    }




    static if(!is(typeof(SEEK_SET))) {
        private enum enumMixinStr_SEEK_SET = `enum SEEK_SET = 0;`;
        static if(is(typeof({ mixin(enumMixinStr_SEEK_SET); }))) {
            mixin(enumMixinStr_SEEK_SET);
        }
    }




    static if(!is(typeof(SEEK_END))) {
        private enum enumMixinStr_SEEK_END = `enum SEEK_END = 2;`;
        static if(is(typeof({ mixin(enumMixinStr_SEEK_END); }))) {
            mixin(enumMixinStr_SEEK_END);
        }
    }




    static if(!is(typeof(SEEK_CUR))) {
        private enum enumMixinStr_SEEK_CUR = `enum SEEK_CUR = 1;`;
        static if(is(typeof({ mixin(enumMixinStr_SEEK_CUR); }))) {
            mixin(enumMixinStr_SEEK_CUR);
        }
    }




    static if(!is(typeof(L_tmpnam_s))) {
        private enum enumMixinStr_L_tmpnam_s = `enum L_tmpnam_s = L_tmpnam;`;
        static if(is(typeof({ mixin(enumMixinStr_L_tmpnam_s); }))) {
            mixin(enumMixinStr_L_tmpnam_s);
        }
    }




    static if(!is(typeof(L_tmpnam))) {
        private enum enumMixinStr_L_tmpnam = `enum L_tmpnam = 260;`;
        static if(is(typeof({ mixin(enumMixinStr_L_tmpnam); }))) {
            mixin(enumMixinStr_L_tmpnam);
        }
    }




    static if(!is(typeof(_IONBF))) {
        private enum enumMixinStr__IONBF = `enum _IONBF = 0x0004;`;
        static if(is(typeof({ mixin(enumMixinStr__IONBF); }))) {
            mixin(enumMixinStr__IONBF);
        }
    }




    static if(!is(typeof(_IOLBF))) {
        private enum enumMixinStr__IOLBF = `enum _IOLBF = 0x0040;`;
        static if(is(typeof({ mixin(enumMixinStr__IOLBF); }))) {
            mixin(enumMixinStr__IOLBF);
        }
    }




    static if(!is(typeof(_IOFBF))) {
        private enum enumMixinStr__IOFBF = `enum _IOFBF = 0x0000;`;
        static if(is(typeof({ mixin(enumMixinStr__IOFBF); }))) {
            mixin(enumMixinStr__IOFBF);
        }
    }




    static if(!is(typeof(EOF))) {
        private enum enumMixinStr_EOF = `enum EOF = ( - 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_EOF); }))) {
            mixin(enumMixinStr_EOF);
        }
    }




    static if(!is(typeof(_IOB_ENTRIES))) {
        private enum enumMixinStr__IOB_ENTRIES = `enum _IOB_ENTRIES = 3;`;
        static if(is(typeof({ mixin(enumMixinStr__IOB_ENTRIES); }))) {
            mixin(enumMixinStr__IOB_ENTRIES);
        }
    }




    static if(!is(typeof(_NSTREAM_))) {
        private enum enumMixinStr__NSTREAM_ = `enum _NSTREAM_ = 512;`;
        static if(is(typeof({ mixin(enumMixinStr__NSTREAM_); }))) {
            mixin(enumMixinStr__NSTREAM_);
        }
    }




    static if(!is(typeof(_NFILE))) {
        private enum enumMixinStr__NFILE = `enum _NFILE = 512;`;
        static if(is(typeof({ mixin(enumMixinStr__NFILE); }))) {
            mixin(enumMixinStr__NFILE);
        }
    }




    static if(!is(typeof(BUFSIZ))) {
        private enum enumMixinStr_BUFSIZ = `enum BUFSIZ = 512;`;
        static if(is(typeof({ mixin(enumMixinStr_BUFSIZ); }))) {
            mixin(enumMixinStr_BUFSIZ);
        }
    }






    static if(!is(typeof(_SWPRINTFS_DEPRECATED))) {
        private enum enumMixinStr__SWPRINTFS_DEPRECATED = `enum _SWPRINTFS_DEPRECATED = _CRT_DEPRECATE_TEXT ( "function has been changed to conform with the ISO C standard, " "adding an extra character count parameter. To use the traditional " "Microsoft version, set _CRT_NON_CONFORMING_SWPRINTFS." );`;
        static if(is(typeof({ mixin(enumMixinStr__SWPRINTFS_DEPRECATED); }))) {
            mixin(enumMixinStr__SWPRINTFS_DEPRECATED);
        }
    }




    static if(!is(typeof(WEOF))) {
        private enum enumMixinStr_WEOF = `enum WEOF = ( ( wint_t ) ( 0xFFFF ) );`;
        static if(is(typeof({ mixin(enumMixinStr_WEOF); }))) {
            mixin(enumMixinStr_WEOF);
        }
    }




    static if(!is(typeof(stderr))) {
        private enum enumMixinStr_stderr = `enum stderr = ( __acrt_iob_func ( 2 ) );`;
        static if(is(typeof({ mixin(enumMixinStr_stderr); }))) {
            mixin(enumMixinStr_stderr);
        }
    }




    static if(!is(typeof(stdout))) {
        private enum enumMixinStr_stdout = `enum stdout = ( __acrt_iob_func ( 1 ) );`;
        static if(is(typeof({ mixin(enumMixinStr_stdout); }))) {
            mixin(enumMixinStr_stdout);
        }
    }




    static if(!is(typeof(stdin))) {
        private enum enumMixinStr_stdin = `enum stdin = ( __acrt_iob_func ( 0 ) );`;
        static if(is(typeof({ mixin(enumMixinStr_stdin); }))) {
            mixin(enumMixinStr_stdin);
        }
    }






    static if(!is(typeof(_CRT_INTERNAL_SCANF_LEGACY_MSVCRT_COMPATIBILITY))) {
        private enum enumMixinStr__CRT_INTERNAL_SCANF_LEGACY_MSVCRT_COMPATIBILITY = `enum _CRT_INTERNAL_SCANF_LEGACY_MSVCRT_COMPATIBILITY = ( 1ULL << 2 );`;
        static if(is(typeof({ mixin(enumMixinStr__CRT_INTERNAL_SCANF_LEGACY_MSVCRT_COMPATIBILITY); }))) {
            mixin(enumMixinStr__CRT_INTERNAL_SCANF_LEGACY_MSVCRT_COMPATIBILITY);
        }
    }




    static if(!is(typeof(_CRT_INTERNAL_SCANF_LEGACY_WIDE_SPECIFIERS))) {
        private enum enumMixinStr__CRT_INTERNAL_SCANF_LEGACY_WIDE_SPECIFIERS = `enum _CRT_INTERNAL_SCANF_LEGACY_WIDE_SPECIFIERS = ( 1ULL << 1 );`;
        static if(is(typeof({ mixin(enumMixinStr__CRT_INTERNAL_SCANF_LEGACY_WIDE_SPECIFIERS); }))) {
            mixin(enumMixinStr__CRT_INTERNAL_SCANF_LEGACY_WIDE_SPECIFIERS);
        }
    }




    static if(!is(typeof(_CRT_INTERNAL_SCANF_SECURECRT))) {
        private enum enumMixinStr__CRT_INTERNAL_SCANF_SECURECRT = `enum _CRT_INTERNAL_SCANF_SECURECRT = ( 1ULL << 0 );`;
        static if(is(typeof({ mixin(enumMixinStr__CRT_INTERNAL_SCANF_SECURECRT); }))) {
            mixin(enumMixinStr__CRT_INTERNAL_SCANF_SECURECRT);
        }
    }




    static if(!is(typeof(_CRT_INTERNAL_PRINTF_LEGACY_THREE_DIGIT_EXPONENTS))) {
        private enum enumMixinStr__CRT_INTERNAL_PRINTF_LEGACY_THREE_DIGIT_EXPONENTS = `enum _CRT_INTERNAL_PRINTF_LEGACY_THREE_DIGIT_EXPONENTS = ( 1ULL << 4 );`;
        static if(is(typeof({ mixin(enumMixinStr__CRT_INTERNAL_PRINTF_LEGACY_THREE_DIGIT_EXPONENTS); }))) {
            mixin(enumMixinStr__CRT_INTERNAL_PRINTF_LEGACY_THREE_DIGIT_EXPONENTS);
        }
    }




    static if(!is(typeof(_CRT_INTERNAL_PRINTF_LEGACY_MSVCRT_COMPATIBILITY))) {
        private enum enumMixinStr__CRT_INTERNAL_PRINTF_LEGACY_MSVCRT_COMPATIBILITY = `enum _CRT_INTERNAL_PRINTF_LEGACY_MSVCRT_COMPATIBILITY = ( 1ULL << 3 );`;
        static if(is(typeof({ mixin(enumMixinStr__CRT_INTERNAL_PRINTF_LEGACY_MSVCRT_COMPATIBILITY); }))) {
            mixin(enumMixinStr__CRT_INTERNAL_PRINTF_LEGACY_MSVCRT_COMPATIBILITY);
        }
    }




    static if(!is(typeof(_CRT_INTERNAL_PRINTF_LEGACY_WIDE_SPECIFIERS))) {
        private enum enumMixinStr__CRT_INTERNAL_PRINTF_LEGACY_WIDE_SPECIFIERS = `enum _CRT_INTERNAL_PRINTF_LEGACY_WIDE_SPECIFIERS = ( 1ULL << 2 );`;
        static if(is(typeof({ mixin(enumMixinStr__CRT_INTERNAL_PRINTF_LEGACY_WIDE_SPECIFIERS); }))) {
            mixin(enumMixinStr__CRT_INTERNAL_PRINTF_LEGACY_WIDE_SPECIFIERS);
        }
    }




    static if(!is(typeof(_CRT_INTERNAL_PRINTF_STANDARD_SNPRINTF_BEHAVIOR))) {
        private enum enumMixinStr__CRT_INTERNAL_PRINTF_STANDARD_SNPRINTF_BEHAVIOR = `enum _CRT_INTERNAL_PRINTF_STANDARD_SNPRINTF_BEHAVIOR = ( 1ULL << 1 );`;
        static if(is(typeof({ mixin(enumMixinStr__CRT_INTERNAL_PRINTF_STANDARD_SNPRINTF_BEHAVIOR); }))) {
            mixin(enumMixinStr__CRT_INTERNAL_PRINTF_STANDARD_SNPRINTF_BEHAVIOR);
        }
    }




    static if(!is(typeof(_CRT_INTERNAL_PRINTF_LEGACY_VSPRINTF_NULL_TERMINATION))) {
        private enum enumMixinStr__CRT_INTERNAL_PRINTF_LEGACY_VSPRINTF_NULL_TERMINATION = `enum _CRT_INTERNAL_PRINTF_LEGACY_VSPRINTF_NULL_TERMINATION = ( 1ULL << 0 );`;
        static if(is(typeof({ mixin(enumMixinStr__CRT_INTERNAL_PRINTF_LEGACY_VSPRINTF_NULL_TERMINATION); }))) {
            mixin(enumMixinStr__CRT_INTERNAL_PRINTF_LEGACY_VSPRINTF_NULL_TERMINATION);
        }
    }




    static if(!is(typeof(_CRT_INTERNAL_LOCAL_SCANF_OPTIONS))) {
        private enum enumMixinStr__CRT_INTERNAL_LOCAL_SCANF_OPTIONS = `enum _CRT_INTERNAL_LOCAL_SCANF_OPTIONS = ( * __local_stdio_scanf_options ( ) );`;
        static if(is(typeof({ mixin(enumMixinStr__CRT_INTERNAL_LOCAL_SCANF_OPTIONS); }))) {
            mixin(enumMixinStr__CRT_INTERNAL_LOCAL_SCANF_OPTIONS);
        }
    }




    static if(!is(typeof(_CRT_INTERNAL_LOCAL_PRINTF_OPTIONS))) {
        private enum enumMixinStr__CRT_INTERNAL_LOCAL_PRINTF_OPTIONS = `enum _CRT_INTERNAL_LOCAL_PRINTF_OPTIONS = ( * __local_stdio_printf_options ( ) );`;
        static if(is(typeof({ mixin(enumMixinStr__CRT_INTERNAL_LOCAL_PRINTF_OPTIONS); }))) {
            mixin(enumMixinStr__CRT_INTERNAL_LOCAL_PRINTF_OPTIONS);
        }
    }




    static if(!is(typeof(_CRT_INTERNAL_STDIO_SYMBOL_PREFIX))) {
        private enum enumMixinStr__CRT_INTERNAL_STDIO_SYMBOL_PREFIX = `enum _CRT_INTERNAL_STDIO_SYMBOL_PREFIX = "";`;
        static if(is(typeof({ mixin(enumMixinStr__CRT_INTERNAL_STDIO_SYMBOL_PREFIX); }))) {
            mixin(enumMixinStr__CRT_INTERNAL_STDIO_SYMBOL_PREFIX);
        }
    }




    static if(!is(typeof(_CRT_STDIO_INLINE))) {
        private enum enumMixinStr__CRT_STDIO_INLINE = `enum _CRT_STDIO_INLINE = __inline;`;
        static if(is(typeof({ mixin(enumMixinStr__CRT_STDIO_INLINE); }))) {
            mixin(enumMixinStr__CRT_STDIO_INLINE);
        }
    }
    static if(!is(typeof(_CRT_SECURE_CPP_NOTHROW))) {
        private enum enumMixinStr__CRT_SECURE_CPP_NOTHROW = `enum _CRT_SECURE_CPP_NOTHROW = throw ( );`;
        static if(is(typeof({ mixin(enumMixinStr__CRT_SECURE_CPP_NOTHROW); }))) {
            mixin(enumMixinStr__CRT_SECURE_CPP_NOTHROW);
        }
    }




    static if(!is(typeof(_CRT_SECURE_CPP_OVERLOAD_SECURE_NAMES_MEMORY))) {
        private enum enumMixinStr__CRT_SECURE_CPP_OVERLOAD_SECURE_NAMES_MEMORY = `enum _CRT_SECURE_CPP_OVERLOAD_SECURE_NAMES_MEMORY = 0;`;
        static if(is(typeof({ mixin(enumMixinStr__CRT_SECURE_CPP_OVERLOAD_SECURE_NAMES_MEMORY); }))) {
            mixin(enumMixinStr__CRT_SECURE_CPP_OVERLOAD_SECURE_NAMES_MEMORY);
        }
    }




    static if(!is(typeof(_CRT_SECURE_CPP_OVERLOAD_STANDARD_NAMES_MEMORY))) {
        private enum enumMixinStr__CRT_SECURE_CPP_OVERLOAD_STANDARD_NAMES_MEMORY = `enum _CRT_SECURE_CPP_OVERLOAD_STANDARD_NAMES_MEMORY = 0;`;
        static if(is(typeof({ mixin(enumMixinStr__CRT_SECURE_CPP_OVERLOAD_STANDARD_NAMES_MEMORY); }))) {
            mixin(enumMixinStr__CRT_SECURE_CPP_OVERLOAD_STANDARD_NAMES_MEMORY);
        }
    }




    static if(!is(typeof(_CRT_SECURE_CPP_OVERLOAD_SECURE_NAMES))) {
        private enum enumMixinStr__CRT_SECURE_CPP_OVERLOAD_SECURE_NAMES = `enum _CRT_SECURE_CPP_OVERLOAD_SECURE_NAMES = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__CRT_SECURE_CPP_OVERLOAD_SECURE_NAMES); }))) {
            mixin(enumMixinStr__CRT_SECURE_CPP_OVERLOAD_SECURE_NAMES);
        }
    }




    static if(!is(typeof(_CRT_SECURE_CPP_OVERLOAD_STANDARD_NAMES_COUNT))) {
        private enum enumMixinStr__CRT_SECURE_CPP_OVERLOAD_STANDARD_NAMES_COUNT = `enum _CRT_SECURE_CPP_OVERLOAD_STANDARD_NAMES_COUNT = 0;`;
        static if(is(typeof({ mixin(enumMixinStr__CRT_SECURE_CPP_OVERLOAD_STANDARD_NAMES_COUNT); }))) {
            mixin(enumMixinStr__CRT_SECURE_CPP_OVERLOAD_STANDARD_NAMES_COUNT);
        }
    }




    static if(!is(typeof(_CRT_SECURE_CPP_OVERLOAD_STANDARD_NAMES))) {
        private enum enumMixinStr__CRT_SECURE_CPP_OVERLOAD_STANDARD_NAMES = `enum _CRT_SECURE_CPP_OVERLOAD_STANDARD_NAMES = 0;`;
        static if(is(typeof({ mixin(enumMixinStr__CRT_SECURE_CPP_OVERLOAD_STANDARD_NAMES); }))) {
            mixin(enumMixinStr__CRT_SECURE_CPP_OVERLOAD_STANDARD_NAMES);
        }
    }






    static if(!is(typeof(_SECURECRT_FILL_BUFFER_PATTERN))) {
        private enum enumMixinStr__SECURECRT_FILL_BUFFER_PATTERN = `enum _SECURECRT_FILL_BUFFER_PATTERN = 0xFE;`;
        static if(is(typeof({ mixin(enumMixinStr__SECURECRT_FILL_BUFFER_PATTERN); }))) {
            mixin(enumMixinStr__SECURECRT_FILL_BUFFER_PATTERN);
        }
    }






    static if(!is(typeof(__GOT_SECURE_LIB__))) {
        private enum enumMixinStr___GOT_SECURE_LIB__ = `enum __GOT_SECURE_LIB__ = __STDC_SECURE_LIB__;`;
        static if(is(typeof({ mixin(enumMixinStr___GOT_SECURE_LIB__); }))) {
            mixin(enumMixinStr___GOT_SECURE_LIB__);
        }
    }
    static if(!is(typeof(_CRT_INTERNAL_NONSTDC_NAMES))) {
        private enum enumMixinStr__CRT_INTERNAL_NONSTDC_NAMES = `enum _CRT_INTERNAL_NONSTDC_NAMES = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__CRT_INTERNAL_NONSTDC_NAMES); }))) {
            mixin(enumMixinStr__CRT_INTERNAL_NONSTDC_NAMES);
        }
    }
    static if(!is(typeof(_CRT_BUILD_DESKTOP_APP))) {
        private enum enumMixinStr__CRT_BUILD_DESKTOP_APP = `enum _CRT_BUILD_DESKTOP_APP = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__CRT_BUILD_DESKTOP_APP); }))) {
            mixin(enumMixinStr__CRT_BUILD_DESKTOP_APP);
        }
    }




    static if(!is(typeof(_ARM_WINAPI_PARTITION_DESKTOP_SDK_AVAILABLE))) {
        private enum enumMixinStr__ARM_WINAPI_PARTITION_DESKTOP_SDK_AVAILABLE = `enum _ARM_WINAPI_PARTITION_DESKTOP_SDK_AVAILABLE = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__ARM_WINAPI_PARTITION_DESKTOP_SDK_AVAILABLE); }))) {
            mixin(enumMixinStr__ARM_WINAPI_PARTITION_DESKTOP_SDK_AVAILABLE);
        }
    }






    static if(!is(typeof(_CRT_HAS_CXX17))) {
        private enum enumMixinStr__CRT_HAS_CXX17 = `enum _CRT_HAS_CXX17 = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__CRT_HAS_CXX17); }))) {
            mixin(enumMixinStr__CRT_HAS_CXX17);
        }
    }






    static if(!is(typeof(_CRT_FUNCTIONS_REQUIRED))) {
        private enum enumMixinStr__CRT_FUNCTIONS_REQUIRED = `enum _CRT_FUNCTIONS_REQUIRED = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__CRT_FUNCTIONS_REQUIRED); }))) {
            mixin(enumMixinStr__CRT_FUNCTIONS_REQUIRED);
        }
    }






    static if(!is(typeof(__FUNCTIONW__))) {
        private enum enumMixinStr___FUNCTIONW__ = `enum __FUNCTIONW__ = _CRT_WIDE cast( __FUNCTION__ );`;
        static if(is(typeof({ mixin(enumMixinStr___FUNCTIONW__); }))) {
            mixin(enumMixinStr___FUNCTIONW__);
        }
    }




    static if(!is(typeof(__FILEW__))) {
        private enum enumMixinStr___FILEW__ = `enum __FILEW__ = _CRT_WIDE ( "D:\\Programming\\Open\\Bindbc-Cimgui\\temp\\cimgui.d.tmp" );`;
        static if(is(typeof({ mixin(enumMixinStr___FILEW__); }))) {
            mixin(enumMixinStr___FILEW__);
        }
    }




    static if(!is(typeof(_CRT_SIZE_MAX))) {
        private enum enumMixinStr__CRT_SIZE_MAX = `enum _CRT_SIZE_MAX = ( ( size_t ) - 1 );`;
        static if(is(typeof({ mixin(enumMixinStr__CRT_SIZE_MAX); }))) {
            mixin(enumMixinStr__CRT_SIZE_MAX);
        }
    }




    static if(!is(typeof(_CRT_INT_MAX))) {
        private enum enumMixinStr__CRT_INT_MAX = `enum _CRT_INT_MAX = 2147483647;`;
        static if(is(typeof({ mixin(enumMixinStr__CRT_INT_MAX); }))) {
            mixin(enumMixinStr__CRT_INT_MAX);
        }
    }




    static if(!is(typeof(_TRUNCATE))) {
        private enum enumMixinStr__TRUNCATE = `enum _TRUNCATE = ( ( size_t ) - 1 );`;
        static if(is(typeof({ mixin(enumMixinStr__TRUNCATE); }))) {
            mixin(enumMixinStr__TRUNCATE);
        }
    }




    static if(!is(typeof(_ARGMAX))) {
        private enum enumMixinStr__ARGMAX = `enum _ARGMAX = 100;`;
        static if(is(typeof({ mixin(enumMixinStr__ARGMAX); }))) {
            mixin(enumMixinStr__ARGMAX);
        }
    }
    static if(!is(typeof(_WConst_return))) {
        private enum enumMixinStr__WConst_return = `enum _WConst_return = _CONST_RETURN;`;
        static if(is(typeof({ mixin(enumMixinStr__WConst_return); }))) {
            mixin(enumMixinStr__WConst_return);
        }
    }
    static if(!is(typeof(_CRTALLOCATOR))) {
        private enum enumMixinStr__CRTALLOCATOR = `enum _CRTALLOCATOR = __declspec ( allocator );`;
        static if(is(typeof({ mixin(enumMixinStr__CRTALLOCATOR); }))) {
            mixin(enumMixinStr__CRTALLOCATOR);
        }
    }




    static if(!is(typeof(_CRTRESTRICT))) {
        private enum enumMixinStr__CRTRESTRICT = `enum _CRTRESTRICT = __declspec ( restrict );`;
        static if(is(typeof({ mixin(enumMixinStr__CRTRESTRICT); }))) {
            mixin(enumMixinStr__CRTRESTRICT);
        }
    }






    static if(!is(typeof(_ACRTIMP_ALT))) {
        private enum enumMixinStr__ACRTIMP_ALT = `enum _ACRTIMP_ALT = _ACRTIMP;`;
        static if(is(typeof({ mixin(enumMixinStr__ACRTIMP_ALT); }))) {
            mixin(enumMixinStr__ACRTIMP_ALT);
        }
    }
    static if(!is(typeof(_NODISCARD))) {
        private enum enumMixinStr__NODISCARD = `enum _NODISCARD = [ [ nodiscard ] ];`;
        static if(is(typeof({ mixin(enumMixinStr__NODISCARD); }))) {
            mixin(enumMixinStr__NODISCARD);
        }
    }




    static if(!is(typeof(_HAS_NODISCARD))) {
        private enum enumMixinStr__HAS_NODISCARD = `enum _HAS_NODISCARD = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__HAS_NODISCARD); }))) {
            mixin(enumMixinStr__HAS_NODISCARD);
        }
    }




    static if(!is(typeof(_HAS_CXX20))) {
        private enum enumMixinStr__HAS_CXX20 = `enum _HAS_CXX20 = 0;`;
        static if(is(typeof({ mixin(enumMixinStr__HAS_CXX20); }))) {
            mixin(enumMixinStr__HAS_CXX20);
        }
    }




    static if(!is(typeof(_HAS_CXX17))) {
        private enum enumMixinStr__HAS_CXX17 = `enum _HAS_CXX17 = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__HAS_CXX17); }))) {
            mixin(enumMixinStr__HAS_CXX17);
        }
    }




    static if(!is(typeof(_STL_LANG))) {
        private enum enumMixinStr__STL_LANG = `enum _STL_LANG = _MSVC_LANG;`;
        static if(is(typeof({ mixin(enumMixinStr__STL_LANG); }))) {
            mixin(enumMixinStr__STL_LANG);
        }
    }






    static if(!is(typeof(_UNALIGNED))) {
        private enum enumMixinStr__UNALIGNED = `enum _UNALIGNED = __unaligned;`;
        static if(is(typeof({ mixin(enumMixinStr__UNALIGNED); }))) {
            mixin(enumMixinStr__UNALIGNED);
        }
    }




    static if(!is(typeof(NULL))) {
        private enum enumMixinStr_NULL = `enum NULL = 0;`;
        static if(is(typeof({ mixin(enumMixinStr_NULL); }))) {
            mixin(enumMixinStr_NULL);
        }
    }
    static if(!is(typeof(_CONST_RETURN))) {
        private enum enumMixinStr__CONST_RETURN = `enum _CONST_RETURN = const;`;
        static if(is(typeof({ mixin(enumMixinStr__CONST_RETURN); }))) {
            mixin(enumMixinStr__CONST_RETURN);
        }
    }
    static if(!is(typeof(_VCRT_ALLOCATOR))) {
        private enum enumMixinStr__VCRT_ALLOCATOR = `enum _VCRT_ALLOCATOR = __declspec ( allocator );`;
        static if(is(typeof({ mixin(enumMixinStr__VCRT_ALLOCATOR); }))) {
            mixin(enumMixinStr__VCRT_ALLOCATOR);
        }
    }




    static if(!is(typeof(_VCRT_RESTRICT))) {
        private enum enumMixinStr__VCRT_RESTRICT = `enum _VCRT_RESTRICT = __declspec ( restrict );`;
        static if(is(typeof({ mixin(enumMixinStr__VCRT_RESTRICT); }))) {
            mixin(enumMixinStr__VCRT_RESTRICT);
        }
    }




    static if(!is(typeof(_VCRT_NOALIAS))) {
        private enum enumMixinStr__VCRT_NOALIAS = `enum _VCRT_NOALIAS = __declspec ( noalias );`;
        static if(is(typeof({ mixin(enumMixinStr__VCRT_NOALIAS); }))) {
            mixin(enumMixinStr__VCRT_NOALIAS);
        }
    }




    static if(!is(typeof(__CRTDECL))) {
        private enum enumMixinStr___CRTDECL = `enum __CRTDECL = __CLRCALL_PURE_OR_CDECL;`;
        static if(is(typeof({ mixin(enumMixinStr___CRTDECL); }))) {
            mixin(enumMixinStr___CRTDECL);
        }
    }




    static if(!is(typeof(__CLRCALL_PURE_OR_CDECL))) {
        private enum enumMixinStr___CLRCALL_PURE_OR_CDECL = `enum __CLRCALL_PURE_OR_CDECL = __cdecl;`;
        static if(is(typeof({ mixin(enumMixinStr___CLRCALL_PURE_OR_CDECL); }))) {
            mixin(enumMixinStr___CLRCALL_PURE_OR_CDECL);
        }
    }






    static if(!is(typeof(__CLRCALL_OR_CDECL))) {
        private enum enumMixinStr___CLRCALL_OR_CDECL = `enum __CLRCALL_OR_CDECL = __cdecl;`;
        static if(is(typeof({ mixin(enumMixinStr___CLRCALL_OR_CDECL); }))) {
            mixin(enumMixinStr___CLRCALL_OR_CDECL);
        }
    }
    static if(!is(typeof(_HAS_EXCEPTIONS))) {
        private enum enumMixinStr__HAS_EXCEPTIONS = `enum _HAS_EXCEPTIONS = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__HAS_EXCEPTIONS); }))) {
            mixin(enumMixinStr__HAS_EXCEPTIONS);
        }
    }




    static if(!is(typeof(_CRT_END_C_HEADER))) {
        private enum enumMixinStr__CRT_END_C_HEADER = `enum _CRT_END_C_HEADER = }
;`;
        static if(is(typeof({ mixin(enumMixinStr__CRT_END_C_HEADER); }))) {
            mixin(enumMixinStr__CRT_END_C_HEADER);
        }
    }




    static if(!is(typeof(_CRT_BEGIN_C_HEADER))) {
        private enum enumMixinStr__CRT_BEGIN_C_HEADER = `enum _CRT_BEGIN_C_HEADER =
 extern "C" {;`;
        static if(is(typeof({ mixin(enumMixinStr__CRT_BEGIN_C_HEADER); }))) {
            mixin(enumMixinStr__CRT_BEGIN_C_HEADER);
        }
    }
    static if(!is(typeof(_VCRT_COMPILER_PREPROCESSOR))) {
        private enum enumMixinStr__VCRT_COMPILER_PREPROCESSOR = `enum _VCRT_COMPILER_PREPROCESSOR = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__VCRT_COMPILER_PREPROCESSOR); }))) {
            mixin(enumMixinStr__VCRT_COMPILER_PREPROCESSOR);
        }
    }
    static if(!is(typeof(_VCRUNTIME_DISABLED_WARNINGS))) {
        private enum enumMixinStr__VCRUNTIME_DISABLED_WARNINGS = `enum _VCRUNTIME_DISABLED_WARNINGS = _VCRUNTIME_DISABLED_WARNING_4339 _VCRUNTIME_DISABLED_WARNING_4412 4514 4820 _VCRUNTIME_EXTRA_DISABLED_WARNINGS;`;
        static if(is(typeof({ mixin(enumMixinStr__VCRUNTIME_DISABLED_WARNINGS); }))) {
            mixin(enumMixinStr__VCRUNTIME_DISABLED_WARNINGS);
        }
    }
    static if(!is(typeof(_CRT_PACKING))) {
        private enum enumMixinStr__CRT_PACKING = `enum _CRT_PACKING = 8;`;
        static if(is(typeof({ mixin(enumMixinStr__CRT_PACKING); }))) {
            mixin(enumMixinStr__CRT_PACKING);
        }
    }
    static if(!is(typeof(WINT_MAX))) {
        private enum enumMixinStr_WINT_MAX = `enum WINT_MAX = 0xffff;`;
        static if(is(typeof({ mixin(enumMixinStr_WINT_MAX); }))) {
            mixin(enumMixinStr_WINT_MAX);
        }
    }




    static if(!is(typeof(WINT_MIN))) {
        private enum enumMixinStr_WINT_MIN = `enum WINT_MIN = 0x0000;`;
        static if(is(typeof({ mixin(enumMixinStr_WINT_MIN); }))) {
            mixin(enumMixinStr_WINT_MIN);
        }
    }




    static if(!is(typeof(WCHAR_MAX))) {
        private enum enumMixinStr_WCHAR_MAX = `enum WCHAR_MAX = 0xffff;`;
        static if(is(typeof({ mixin(enumMixinStr_WCHAR_MAX); }))) {
            mixin(enumMixinStr_WCHAR_MAX);
        }
    }




    static if(!is(typeof(WCHAR_MIN))) {
        private enum enumMixinStr_WCHAR_MIN = `enum WCHAR_MIN = 0x0000;`;
        static if(is(typeof({ mixin(enumMixinStr_WCHAR_MIN); }))) {
            mixin(enumMixinStr_WCHAR_MIN);
        }
    }




    static if(!is(typeof(SIG_ATOMIC_MAX))) {
        private enum enumMixinStr_SIG_ATOMIC_MAX = `enum SIG_ATOMIC_MAX = INT32_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr_SIG_ATOMIC_MAX); }))) {
            mixin(enumMixinStr_SIG_ATOMIC_MAX);
        }
    }




    static if(!is(typeof(SIG_ATOMIC_MIN))) {
        private enum enumMixinStr_SIG_ATOMIC_MIN = `enum SIG_ATOMIC_MIN = INT32_MIN;`;
        static if(is(typeof({ mixin(enumMixinStr_SIG_ATOMIC_MIN); }))) {
            mixin(enumMixinStr_SIG_ATOMIC_MIN);
        }
    }




    static if(!is(typeof(SIZE_MAX))) {
        private enum enumMixinStr_SIZE_MAX = `enum SIZE_MAX = UINTPTR_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr_SIZE_MAX); }))) {
            mixin(enumMixinStr_SIZE_MAX);
        }
    }




    static if(!is(typeof(PTRDIFF_MAX))) {
        private enum enumMixinStr_PTRDIFF_MAX = `enum PTRDIFF_MAX = INTPTR_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr_PTRDIFF_MAX); }))) {
            mixin(enumMixinStr_PTRDIFF_MAX);
        }
    }




    static if(!is(typeof(PTRDIFF_MIN))) {
        private enum enumMixinStr_PTRDIFF_MIN = `enum PTRDIFF_MIN = INTPTR_MIN;`;
        static if(is(typeof({ mixin(enumMixinStr_PTRDIFF_MIN); }))) {
            mixin(enumMixinStr_PTRDIFF_MIN);
        }
    }




    static if(!is(typeof(UINTMAX_MAX))) {
        private enum enumMixinStr_UINTMAX_MAX = `enum UINTMAX_MAX = UINT64_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr_UINTMAX_MAX); }))) {
            mixin(enumMixinStr_UINTMAX_MAX);
        }
    }




    static if(!is(typeof(INTMAX_MAX))) {
        private enum enumMixinStr_INTMAX_MAX = `enum INTMAX_MAX = INT64_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr_INTMAX_MAX); }))) {
            mixin(enumMixinStr_INTMAX_MAX);
        }
    }




    static if(!is(typeof(INTMAX_MIN))) {
        private enum enumMixinStr_INTMAX_MIN = `enum INTMAX_MIN = INT64_MIN;`;
        static if(is(typeof({ mixin(enumMixinStr_INTMAX_MIN); }))) {
            mixin(enumMixinStr_INTMAX_MIN);
        }
    }




    static if(!is(typeof(UINTPTR_MAX))) {
        private enum enumMixinStr_UINTPTR_MAX = `enum UINTPTR_MAX = UINT64_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr_UINTPTR_MAX); }))) {
            mixin(enumMixinStr_UINTPTR_MAX);
        }
    }




    static if(!is(typeof(INTPTR_MAX))) {
        private enum enumMixinStr_INTPTR_MAX = `enum INTPTR_MAX = INT64_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr_INTPTR_MAX); }))) {
            mixin(enumMixinStr_INTPTR_MAX);
        }
    }




    static if(!is(typeof(INTPTR_MIN))) {
        private enum enumMixinStr_INTPTR_MIN = `enum INTPTR_MIN = INT64_MIN;`;
        static if(is(typeof({ mixin(enumMixinStr_INTPTR_MIN); }))) {
            mixin(enumMixinStr_INTPTR_MIN);
        }
    }




    static if(!is(typeof(UINT_FAST64_MAX))) {
        private enum enumMixinStr_UINT_FAST64_MAX = `enum UINT_FAST64_MAX = UINT64_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr_UINT_FAST64_MAX); }))) {
            mixin(enumMixinStr_UINT_FAST64_MAX);
        }
    }




    static if(!is(typeof(UINT_FAST32_MAX))) {
        private enum enumMixinStr_UINT_FAST32_MAX = `enum UINT_FAST32_MAX = UINT32_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr_UINT_FAST32_MAX); }))) {
            mixin(enumMixinStr_UINT_FAST32_MAX);
        }
    }




    static if(!is(typeof(UINT_FAST16_MAX))) {
        private enum enumMixinStr_UINT_FAST16_MAX = `enum UINT_FAST16_MAX = UINT32_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr_UINT_FAST16_MAX); }))) {
            mixin(enumMixinStr_UINT_FAST16_MAX);
        }
    }




    static if(!is(typeof(UINT_FAST8_MAX))) {
        private enum enumMixinStr_UINT_FAST8_MAX = `enum UINT_FAST8_MAX = UINT8_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr_UINT_FAST8_MAX); }))) {
            mixin(enumMixinStr_UINT_FAST8_MAX);
        }
    }




    static if(!is(typeof(INT_FAST64_MAX))) {
        private enum enumMixinStr_INT_FAST64_MAX = `enum INT_FAST64_MAX = INT64_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr_INT_FAST64_MAX); }))) {
            mixin(enumMixinStr_INT_FAST64_MAX);
        }
    }




    static if(!is(typeof(INT_FAST32_MAX))) {
        private enum enumMixinStr_INT_FAST32_MAX = `enum INT_FAST32_MAX = INT32_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr_INT_FAST32_MAX); }))) {
            mixin(enumMixinStr_INT_FAST32_MAX);
        }
    }




    static if(!is(typeof(INT_FAST16_MAX))) {
        private enum enumMixinStr_INT_FAST16_MAX = `enum INT_FAST16_MAX = INT32_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr_INT_FAST16_MAX); }))) {
            mixin(enumMixinStr_INT_FAST16_MAX);
        }
    }




    static if(!is(typeof(INT_FAST8_MAX))) {
        private enum enumMixinStr_INT_FAST8_MAX = `enum INT_FAST8_MAX = INT8_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr_INT_FAST8_MAX); }))) {
            mixin(enumMixinStr_INT_FAST8_MAX);
        }
    }




    static if(!is(typeof(INT_FAST64_MIN))) {
        private enum enumMixinStr_INT_FAST64_MIN = `enum INT_FAST64_MIN = INT64_MIN;`;
        static if(is(typeof({ mixin(enumMixinStr_INT_FAST64_MIN); }))) {
            mixin(enumMixinStr_INT_FAST64_MIN);
        }
    }




    static if(!is(typeof(INT_FAST32_MIN))) {
        private enum enumMixinStr_INT_FAST32_MIN = `enum INT_FAST32_MIN = INT32_MIN;`;
        static if(is(typeof({ mixin(enumMixinStr_INT_FAST32_MIN); }))) {
            mixin(enumMixinStr_INT_FAST32_MIN);
        }
    }




    static if(!is(typeof(INT_FAST16_MIN))) {
        private enum enumMixinStr_INT_FAST16_MIN = `enum INT_FAST16_MIN = INT32_MIN;`;
        static if(is(typeof({ mixin(enumMixinStr_INT_FAST16_MIN); }))) {
            mixin(enumMixinStr_INT_FAST16_MIN);
        }
    }




    static if(!is(typeof(INT_FAST8_MIN))) {
        private enum enumMixinStr_INT_FAST8_MIN = `enum INT_FAST8_MIN = INT8_MIN;`;
        static if(is(typeof({ mixin(enumMixinStr_INT_FAST8_MIN); }))) {
            mixin(enumMixinStr_INT_FAST8_MIN);
        }
    }




    static if(!is(typeof(UINT_LEAST64_MAX))) {
        private enum enumMixinStr_UINT_LEAST64_MAX = `enum UINT_LEAST64_MAX = UINT64_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr_UINT_LEAST64_MAX); }))) {
            mixin(enumMixinStr_UINT_LEAST64_MAX);
        }
    }




    static if(!is(typeof(UINT_LEAST32_MAX))) {
        private enum enumMixinStr_UINT_LEAST32_MAX = `enum UINT_LEAST32_MAX = UINT32_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr_UINT_LEAST32_MAX); }))) {
            mixin(enumMixinStr_UINT_LEAST32_MAX);
        }
    }




    static if(!is(typeof(UINT_LEAST16_MAX))) {
        private enum enumMixinStr_UINT_LEAST16_MAX = `enum UINT_LEAST16_MAX = UINT16_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr_UINT_LEAST16_MAX); }))) {
            mixin(enumMixinStr_UINT_LEAST16_MAX);
        }
    }




    static if(!is(typeof(UINT_LEAST8_MAX))) {
        private enum enumMixinStr_UINT_LEAST8_MAX = `enum UINT_LEAST8_MAX = UINT8_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr_UINT_LEAST8_MAX); }))) {
            mixin(enumMixinStr_UINT_LEAST8_MAX);
        }
    }




    static if(!is(typeof(INT_LEAST64_MAX))) {
        private enum enumMixinStr_INT_LEAST64_MAX = `enum INT_LEAST64_MAX = INT64_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr_INT_LEAST64_MAX); }))) {
            mixin(enumMixinStr_INT_LEAST64_MAX);
        }
    }




    static if(!is(typeof(INT_LEAST32_MAX))) {
        private enum enumMixinStr_INT_LEAST32_MAX = `enum INT_LEAST32_MAX = INT32_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr_INT_LEAST32_MAX); }))) {
            mixin(enumMixinStr_INT_LEAST32_MAX);
        }
    }




    static if(!is(typeof(INT_LEAST16_MAX))) {
        private enum enumMixinStr_INT_LEAST16_MAX = `enum INT_LEAST16_MAX = INT16_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr_INT_LEAST16_MAX); }))) {
            mixin(enumMixinStr_INT_LEAST16_MAX);
        }
    }




    static if(!is(typeof(INT_LEAST8_MAX))) {
        private enum enumMixinStr_INT_LEAST8_MAX = `enum INT_LEAST8_MAX = INT8_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr_INT_LEAST8_MAX); }))) {
            mixin(enumMixinStr_INT_LEAST8_MAX);
        }
    }




    static if(!is(typeof(INT_LEAST64_MIN))) {
        private enum enumMixinStr_INT_LEAST64_MIN = `enum INT_LEAST64_MIN = INT64_MIN;`;
        static if(is(typeof({ mixin(enumMixinStr_INT_LEAST64_MIN); }))) {
            mixin(enumMixinStr_INT_LEAST64_MIN);
        }
    }




    static if(!is(typeof(INT_LEAST32_MIN))) {
        private enum enumMixinStr_INT_LEAST32_MIN = `enum INT_LEAST32_MIN = INT32_MIN;`;
        static if(is(typeof({ mixin(enumMixinStr_INT_LEAST32_MIN); }))) {
            mixin(enumMixinStr_INT_LEAST32_MIN);
        }
    }




    static if(!is(typeof(INT_LEAST16_MIN))) {
        private enum enumMixinStr_INT_LEAST16_MIN = `enum INT_LEAST16_MIN = INT16_MIN;`;
        static if(is(typeof({ mixin(enumMixinStr_INT_LEAST16_MIN); }))) {
            mixin(enumMixinStr_INT_LEAST16_MIN);
        }
    }




    static if(!is(typeof(INT_LEAST8_MIN))) {
        private enum enumMixinStr_INT_LEAST8_MIN = `enum INT_LEAST8_MIN = INT8_MIN;`;
        static if(is(typeof({ mixin(enumMixinStr_INT_LEAST8_MIN); }))) {
            mixin(enumMixinStr_INT_LEAST8_MIN);
        }
    }




    static if(!is(typeof(UINT64_MAX))) {
        private enum enumMixinStr_UINT64_MAX = `enum UINT64_MAX = 0xffffffffffffffffuL;`;
        static if(is(typeof({ mixin(enumMixinStr_UINT64_MAX); }))) {
            mixin(enumMixinStr_UINT64_MAX);
        }
    }




    static if(!is(typeof(UINT32_MAX))) {
        private enum enumMixinStr_UINT32_MAX = `enum UINT32_MAX = 0xffffffffu;`;
        static if(is(typeof({ mixin(enumMixinStr_UINT32_MAX); }))) {
            mixin(enumMixinStr_UINT32_MAX);
        }
    }




    static if(!is(typeof(UINT16_MAX))) {
        private enum enumMixinStr_UINT16_MAX = `enum UINT16_MAX = 0xffffu;`;
        static if(is(typeof({ mixin(enumMixinStr_UINT16_MAX); }))) {
            mixin(enumMixinStr_UINT16_MAX);
        }
    }




    static if(!is(typeof(UINT8_MAX))) {
        private enum enumMixinStr_UINT8_MAX = `enum UINT8_MAX = 0xff;`;
        static if(is(typeof({ mixin(enumMixinStr_UINT8_MAX); }))) {
            mixin(enumMixinStr_UINT8_MAX);
        }
    }




    static if(!is(typeof(INT64_MAX))) {
        private enum enumMixinStr_INT64_MAX = `enum INT64_MAX = 9223372036854775807L;`;
        static if(is(typeof({ mixin(enumMixinStr_INT64_MAX); }))) {
            mixin(enumMixinStr_INT64_MAX);
        }
    }




    static if(!is(typeof(INT32_MAX))) {
        private enum enumMixinStr_INT32_MAX = `enum INT32_MAX = 2147483647;`;
        static if(is(typeof({ mixin(enumMixinStr_INT32_MAX); }))) {
            mixin(enumMixinStr_INT32_MAX);
        }
    }




    static if(!is(typeof(INT16_MAX))) {
        private enum enumMixinStr_INT16_MAX = `enum INT16_MAX = 32767;`;
        static if(is(typeof({ mixin(enumMixinStr_INT16_MAX); }))) {
            mixin(enumMixinStr_INT16_MAX);
        }
    }




    static if(!is(typeof(INT8_MAX))) {
        private enum enumMixinStr_INT8_MAX = `enum INT8_MAX = 12;`;
        static if(is(typeof({ mixin(enumMixinStr_INT8_MAX); }))) {
            mixin(enumMixinStr_INT8_MAX);
        }
    }




    static if(!is(typeof(INT64_MIN))) {
        private enum enumMixinStr_INT64_MIN = `enum INT64_MIN = ( - 9223372036854775807i64 - 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_INT64_MIN); }))) {
            mixin(enumMixinStr_INT64_MIN);
        }
    }




    static if(!is(typeof(INT32_MIN))) {
        private enum enumMixinStr_INT32_MIN = `enum INT32_MIN = ( - 2147483647i32 - 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_INT32_MIN); }))) {
            mixin(enumMixinStr_INT32_MIN);
        }
    }




    static if(!is(typeof(INT16_MIN))) {
        private enum enumMixinStr_INT16_MIN = `enum INT16_MIN = ( - 32767i16 - 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_INT16_MIN); }))) {
            mixin(enumMixinStr_INT16_MIN);
        }
    }




    static if(!is(typeof(INT8_MIN))) {
        private enum enumMixinStr_INT8_MIN = `enum INT8_MIN = ( - 127i8 - 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_INT8_MIN); }))) {
            mixin(enumMixinStr_INT8_MIN);
        }
    }






    static if(!is(typeof(_Raises_SEH_exception_))) {
        private enum enumMixinStr__Raises_SEH_exception_ = `enum _Raises_SEH_exception_ = _SAL2_Source_ ( _Raises_SEH_exception_ , ( x ) , _Maybe_raises_SEH_exception_ _Analysis_noreturn_ );`;
        static if(is(typeof({ mixin(enumMixinStr__Raises_SEH_exception_); }))) {
            mixin(enumMixinStr__Raises_SEH_exception_);
        }
    }




    static if(!is(typeof(_Maybe_raises_SEH_exception_))) {
        private enum enumMixinStr__Maybe_raises_SEH_exception_ = `enum _Maybe_raises_SEH_exception_ = _SAL2_Source_ ( _Maybe_raises_SEH_exception_ , ( x ) , _Pre_ _SA_annotes1 ( SAL_inTry , __yes ) );`;
        static if(is(typeof({ mixin(enumMixinStr__Maybe_raises_SEH_exception_); }))) {
            mixin(enumMixinStr__Maybe_raises_SEH_exception_);
        }
    }




    static if(!is(typeof(_Strict_type_match_))) {
        private enum enumMixinStr__Strict_type_match_ = `enum _Strict_type_match_ = _SAL2_Source_ ( _Strict_type_match , ( ) , _SA_annotes0 ( SAL_strictType2 ) );`;
        static if(is(typeof({ mixin(enumMixinStr__Strict_type_match_); }))) {
            mixin(enumMixinStr__Strict_type_match_);
        }
    }




    static if(!is(typeof(_Enum_is_bitflag_))) {
        private enum enumMixinStr__Enum_is_bitflag_ = `enum _Enum_is_bitflag_ = _SAL2_Source_ ( _Enum_is_bitflag_ , ( ) , _SA_annotes0 ( SAL_enumIsBitflag ) );`;
        static if(is(typeof({ mixin(enumMixinStr__Enum_is_bitflag_); }))) {
            mixin(enumMixinStr__Enum_is_bitflag_);
        }
    }
    static if(!is(typeof(_Analysis_noreturn_))) {
        private enum enumMixinStr__Analysis_noreturn_ = `enum _Analysis_noreturn_ = _SAL2_Source_ ( _Analysis_noreturn_ , ( ) , _SA_annotes0 ( SAL_terminates ) );`;
        static if(is(typeof({ mixin(enumMixinStr__Analysis_noreturn_); }))) {
            mixin(enumMixinStr__Analysis_noreturn_);
        }
    }
    static if(!is(typeof(__fallthrough))) {
        private enum enumMixinStr___fallthrough = `enum __fallthrough = __inner_fallthrough;`;
        static if(is(typeof({ mixin(enumMixinStr___fallthrough); }))) {
            mixin(enumMixinStr___fallthrough);
        }
    }






    static if(!is(typeof(__useHeader))) {
        private enum enumMixinStr___useHeader = `enum __useHeader = _Use_decl_anno_impl_;`;
        static if(is(typeof({ mixin(enumMixinStr___useHeader); }))) {
            mixin(enumMixinStr___useHeader);
        }
    }
    static if(!is(typeof(__format_string))) {
        private enum enumMixinStr___format_string = `enum __format_string = _SAL1_1_Source_ ( __format_string , ( ) , _Printf_format_string_ );`;
        static if(is(typeof({ mixin(enumMixinStr___format_string); }))) {
            mixin(enumMixinStr___format_string);
        }
    }




    static if(!is(typeof(__callback))) {
        private enum enumMixinStr___callback = `enum __callback = __inner_callback;`;
        static if(is(typeof({ mixin(enumMixinStr___callback); }))) {
            mixin(enumMixinStr___callback);
        }
    }




    static if(!is(typeof(__override))) {
        private enum enumMixinStr___override = `enum __override = __inner_override;`;
        static if(is(typeof({ mixin(enumMixinStr___override); }))) {
            mixin(enumMixinStr___override);
        }
    }






    static if(!is(typeof(__checkReturn))) {
        private enum enumMixinStr___checkReturn = `enum __checkReturn = _SAL1_Source_ ( __checkReturn , ( ) , _Check_return_ );`;
        static if(is(typeof({ mixin(enumMixinStr___checkReturn); }))) {
            mixin(enumMixinStr___checkReturn);
        }
    }




    static if(!is(typeof(__reserved))) {
        private enum enumMixinStr___reserved = `enum __reserved = _SAL1_Source_ ( __reserved , ( ) , _Reserved_ );`;
        static if(is(typeof({ mixin(enumMixinStr___reserved); }))) {
            mixin(enumMixinStr___reserved);
        }
    }




    static if(!is(typeof(__nullnullterminated))) {
        private enum enumMixinStr___nullnullterminated = `enum __nullnullterminated = _SAL1_Source_ ( __nullnulltermiated , ( ) , _SAL_nop_impl_ );`;
        static if(is(typeof({ mixin(enumMixinStr___nullnullterminated); }))) {
            mixin(enumMixinStr___nullnullterminated);
        }
    }




    static if(!is(typeof(__nullterminated))) {
        private enum enumMixinStr___nullterminated = `enum __nullterminated = _SAL1_Source_ ( __nullterminated , ( ) , _Null_terminated_ );`;
        static if(is(typeof({ mixin(enumMixinStr___nullterminated); }))) {
            mixin(enumMixinStr___nullterminated);
        }
    }
    static if(!is(typeof(__deref_opt_inout_nz_opt))) {
        private enum enumMixinStr___deref_opt_inout_nz_opt = `enum __deref_opt_inout_nz_opt = _SAL1_Source_ ( __deref_opt_inout_nz_opt , ( ) , __deref_opt_inout_opt );`;
        static if(is(typeof({ mixin(enumMixinStr___deref_opt_inout_nz_opt); }))) {
            mixin(enumMixinStr___deref_opt_inout_nz_opt);
        }
    }
    static if(!is(typeof(__deref_opt_inout_z_opt))) {
        private enum enumMixinStr___deref_opt_inout_z_opt = `enum __deref_opt_inout_z_opt = _SAL1_Source_ ( __deref_opt_inout_z_opt , ( ) , __deref_opt_inout_opt __pre __deref _SAL1_Source_ ( __nullterminated , ( ) , _Null_terminated_ ) __post __deref _SAL1_Source_ ( __nullterminated , ( ) , _Null_terminated_ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___deref_opt_inout_z_opt); }))) {
            mixin(enumMixinStr___deref_opt_inout_z_opt);
        }
    }
    static if(!is(typeof(__deref_opt_inout_opt))) {
        private enum enumMixinStr___deref_opt_inout_opt = `enum __deref_opt_inout_opt = _SAL1_Source_ ( __deref_opt_inout_opt , ( ) , __deref_inout_opt __pre_except_maybenull );`;
        static if(is(typeof({ mixin(enumMixinStr___deref_opt_inout_opt); }))) {
            mixin(enumMixinStr___deref_opt_inout_opt);
        }
    }
    static if(!is(typeof(__deref_opt_out_nz_opt))) {
        private enum enumMixinStr___deref_opt_out_nz_opt = `enum __deref_opt_out_nz_opt = _SAL1_Source_ ( __deref_opt_out_nz_opt , ( ) , __deref_opt_out_opt );`;
        static if(is(typeof({ mixin(enumMixinStr___deref_opt_out_nz_opt); }))) {
            mixin(enumMixinStr___deref_opt_out_nz_opt);
        }
    }
    static if(!is(typeof(__deref_opt_out_z_opt))) {
        private enum enumMixinStr___deref_opt_out_z_opt = `enum __deref_opt_out_z_opt = _SAL1_Source_ ( __deref_opt_out_z_opt , ( ) , __post __deref __valid __refparam __pre_except_maybenull __pre_deref_except_maybenull __post_deref_except_maybenull __post __deref _SAL1_Source_ ( __nullterminated , ( ) , _Null_terminated_ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___deref_opt_out_z_opt); }))) {
            mixin(enumMixinStr___deref_opt_out_z_opt);
        }
    }
    static if(!is(typeof(__deref_opt_out_opt))) {
        private enum enumMixinStr___deref_opt_out_opt = `enum __deref_opt_out_opt = _SAL1_Source_ ( __deref_opt_out_opt , ( ) , _Outptr_opt_result_maybenull_ );`;
        static if(is(typeof({ mixin(enumMixinStr___deref_opt_out_opt); }))) {
            mixin(enumMixinStr___deref_opt_out_opt);
        }
    }
    static if(!is(typeof(__deref_opt_inout_nz))) {
        private enum enumMixinStr___deref_opt_inout_nz = `enum __deref_opt_inout_nz = _SAL1_Source_ ( __deref_opt_inout_nz , ( ) , __deref_opt_inout );`;
        static if(is(typeof({ mixin(enumMixinStr___deref_opt_inout_nz); }))) {
            mixin(enumMixinStr___deref_opt_inout_nz);
        }
    }
    static if(!is(typeof(__deref_opt_inout_z))) {
        private enum enumMixinStr___deref_opt_inout_z = `enum __deref_opt_inout_z = _SAL1_Source_ ( __deref_opt_inout_z , ( ) , __deref_opt_inout __pre __deref _SAL1_Source_ ( __nullterminated , ( ) , _Null_terminated_ ) __post __deref _SAL1_Source_ ( __nullterminated , ( ) , _Null_terminated_ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___deref_opt_inout_z); }))) {
            mixin(enumMixinStr___deref_opt_inout_z);
        }
    }
    static if(!is(typeof(__deref_opt_inout))) {
        private enum enumMixinStr___deref_opt_inout = `enum __deref_opt_inout = _SAL1_Source_ ( __deref_opt_inout , ( ) , _Inout_opt_ );`;
        static if(is(typeof({ mixin(enumMixinStr___deref_opt_inout); }))) {
            mixin(enumMixinStr___deref_opt_inout);
        }
    }
    static if(!is(typeof(__deref_opt_out_z))) {
        private enum enumMixinStr___deref_opt_out_z = `enum __deref_opt_out_z = _SAL1_Source_ ( __deref_opt_out_z , ( ) , _Outptr_opt_result_z_ );`;
        static if(is(typeof({ mixin(enumMixinStr___deref_opt_out_z); }))) {
            mixin(enumMixinStr___deref_opt_out_z);
        }
    }




    static if(!is(typeof(__deref_opt_out))) {
        private enum enumMixinStr___deref_opt_out = `enum __deref_opt_out = _SAL1_Source_ ( __deref_opt_out , ( ) , _Outptr_opt_ );`;
        static if(is(typeof({ mixin(enumMixinStr___deref_opt_out); }))) {
            mixin(enumMixinStr___deref_opt_out);
        }
    }
    static if(!is(typeof(__deref_inout_nz_opt))) {
        private enum enumMixinStr___deref_inout_nz_opt = `enum __deref_inout_nz_opt = _SAL1_Source_ ( __deref_inout_nz_opt , ( ) , __deref_inout_opt );`;
        static if(is(typeof({ mixin(enumMixinStr___deref_inout_nz_opt); }))) {
            mixin(enumMixinStr___deref_inout_nz_opt);
        }
    }
    static if(!is(typeof(__deref_inout_z_opt))) {
        private enum enumMixinStr___deref_inout_z_opt = `enum __deref_inout_z_opt = _SAL1_Source_ ( __deref_inout_z_opt , ( ) , __deref_inout_opt __pre __deref _SAL1_Source_ ( __nullterminated , ( ) , _Null_terminated_ ) __post __deref _SAL1_Source_ ( __nullterminated , ( ) , _Null_terminated_ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___deref_inout_z_opt); }))) {
            mixin(enumMixinStr___deref_inout_z_opt);
        }
    }
    static if(!is(typeof(__deref_inout_opt))) {
        private enum enumMixinStr___deref_inout_opt = `enum __deref_inout_opt = _SAL1_Source_ ( __deref_inout_opt , ( ) , __deref_inout __pre_deref_except_maybenull __post_deref_except_maybenull );`;
        static if(is(typeof({ mixin(enumMixinStr___deref_inout_opt); }))) {
            mixin(enumMixinStr___deref_inout_opt);
        }
    }
    static if(!is(typeof(__deref_out_nz_opt))) {
        private enum enumMixinStr___deref_out_nz_opt = `enum __deref_out_nz_opt = _SAL1_Source_ ( __deref_out_nz_opt , ( ) , __deref_out_opt );`;
        static if(is(typeof({ mixin(enumMixinStr___deref_out_nz_opt); }))) {
            mixin(enumMixinStr___deref_out_nz_opt);
        }
    }
    static if(!is(typeof(__deref_out_z_opt))) {
        private enum enumMixinStr___deref_out_z_opt = `enum __deref_out_z_opt = _SAL1_Source_ ( __deref_out_z_opt , ( ) , _Outptr_result_maybenull_z_ );`;
        static if(is(typeof({ mixin(enumMixinStr___deref_out_z_opt); }))) {
            mixin(enumMixinStr___deref_out_z_opt);
        }
    }
    static if(!is(typeof(__deref_out_opt))) {
        private enum enumMixinStr___deref_out_opt = `enum __deref_out_opt = _SAL1_Source_ ( __deref_out_opt , ( ) , __deref_out __post_deref_except_maybenull );`;
        static if(is(typeof({ mixin(enumMixinStr___deref_out_opt); }))) {
            mixin(enumMixinStr___deref_out_opt);
        }
    }
    static if(!is(typeof(__deref_inout_nz))) {
        private enum enumMixinStr___deref_inout_nz = `enum __deref_inout_nz = _SAL1_Source_ ( __deref_inout_nz , ( ) , __deref_inout );`;
        static if(is(typeof({ mixin(enumMixinStr___deref_inout_nz); }))) {
            mixin(enumMixinStr___deref_inout_nz);
        }
    }
    static if(!is(typeof(__deref_inout_z))) {
        private enum enumMixinStr___deref_inout_z = `enum __deref_inout_z = _SAL1_Source_ ( __deref_inout_z , ( ) , __deref_inout __pre __deref _SAL1_Source_ ( __nullterminated , ( ) , _Null_terminated_ ) __post _Notref_ __deref _SAL1_Source_ ( __nullterminated , ( ) , _Null_terminated_ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___deref_inout_z); }))) {
            mixin(enumMixinStr___deref_inout_z);
        }
    }




    static if(!is(typeof(__deref_inout))) {
        private enum enumMixinStr___deref_inout = `enum __deref_inout = _SAL1_Source_ ( __deref_inout , ( ) , _Notref_ __notnull _Notref_ __elem_readableTo ( 1 ) __pre __deref __valid __post _Notref_ __deref __valid __refparam );`;
        static if(is(typeof({ mixin(enumMixinStr___deref_inout); }))) {
            mixin(enumMixinStr___deref_inout);
        }
    }
    static if(!is(typeof(__deref_out_nz))) {
        private enum enumMixinStr___deref_out_nz = `enum __deref_out_nz = _SAL1_Source_ ( __deref_out_nz , ( ) , __deref_out );`;
        static if(is(typeof({ mixin(enumMixinStr___deref_out_nz); }))) {
            mixin(enumMixinStr___deref_out_nz);
        }
    }
    static if(!is(typeof(__deref_out_z))) {
        private enum enumMixinStr___deref_out_z = `enum __deref_out_z = _SAL1_Source_ ( __deref_out_z , ( ) , _Outptr_result_z_ );`;
        static if(is(typeof({ mixin(enumMixinStr___deref_out_z); }))) {
            mixin(enumMixinStr___deref_out_z);
        }
    }
    static if(!is(typeof(__deref_out))) {
        private enum enumMixinStr___deref_out = `enum __deref_out = _SAL1_Source_ ( __deref_out , ( ) , _Outptr_ );`;
        static if(is(typeof({ mixin(enumMixinStr___deref_out); }))) {
            mixin(enumMixinStr___deref_out);
        }
    }
    static if(!is(typeof(__inout_nz_opt))) {
        private enum enumMixinStr___inout_nz_opt = `enum __inout_nz_opt = _SAL1_Source_ ( __inout_nz_opt , ( ) , __inout_opt );`;
        static if(is(typeof({ mixin(enumMixinStr___inout_nz_opt); }))) {
            mixin(enumMixinStr___inout_nz_opt);
        }
    }
    static if(!is(typeof(__inout_z_opt))) {
        private enum enumMixinStr___inout_z_opt = `enum __inout_z_opt = _SAL1_Source_ ( __inout_z_opt , ( ) , __inout_opt __pre _SAL1_Source_ ( __nullterminated , ( ) , _Null_terminated_ ) __post _SAL1_Source_ ( __nullterminated , ( ) , _Null_terminated_ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___inout_z_opt); }))) {
            mixin(enumMixinStr___inout_z_opt);
        }
    }
    static if(!is(typeof(__inout_opt))) {
        private enum enumMixinStr___inout_opt = `enum __inout_opt = _SAL1_Source_ ( __inout_opt , ( ) , _Inout_opt_ );`;
        static if(is(typeof({ mixin(enumMixinStr___inout_opt); }))) {
            mixin(enumMixinStr___inout_opt);
        }
    }
    static if(!is(typeof(__out_opt))) {
        private enum enumMixinStr___out_opt = `enum __out_opt = _SAL1_Source_ ( __out_opt , ( ) , _Out_opt_ );`;
        static if(is(typeof({ mixin(enumMixinStr___out_opt); }))) {
            mixin(enumMixinStr___out_opt);
        }
    }
    static if(!is(typeof(__in_nz_opt))) {
        private enum enumMixinStr___in_nz_opt = `enum __in_nz_opt = _SAL1_Source_ ( __in_nz_opt , ( ) , __in_opt );`;
        static if(is(typeof({ mixin(enumMixinStr___in_nz_opt); }))) {
            mixin(enumMixinStr___in_nz_opt);
        }
    }
    static if(!is(typeof(__in_z_opt))) {
        private enum enumMixinStr___in_z_opt = `enum __in_z_opt = _SAL1_Source_ ( __in_z_opt , ( ) , _In_opt_z_ );`;
        static if(is(typeof({ mixin(enumMixinStr___in_z_opt); }))) {
            mixin(enumMixinStr___in_z_opt);
        }
    }
    static if(!is(typeof(__in_opt))) {
        private enum enumMixinStr___in_opt = `enum __in_opt = _SAL1_Source_ ( __in_opt , ( ) , _In_opt_ );`;
        static if(is(typeof({ mixin(enumMixinStr___in_opt); }))) {
            mixin(enumMixinStr___in_opt);
        }
    }
    static if(!is(typeof(__inout_nz))) {
        private enum enumMixinStr___inout_nz = `enum __inout_nz = _SAL1_Source_ ( __inout_nz , ( ) , __inout );`;
        static if(is(typeof({ mixin(enumMixinStr___inout_nz); }))) {
            mixin(enumMixinStr___inout_nz);
        }
    }
    static if(!is(typeof(__inout_z))) {
        private enum enumMixinStr___inout_z = `enum __inout_z = _SAL1_Source_ ( __inout_z , ( ) , _Inout_z_ );`;
        static if(is(typeof({ mixin(enumMixinStr___inout_z); }))) {
            mixin(enumMixinStr___inout_z);
        }
    }
    static if(!is(typeof(__inout))) {
        private enum enumMixinStr___inout = `enum __inout = _SAL1_Source_ ( __inout , ( ) , _Inout_ );`;
        static if(is(typeof({ mixin(enumMixinStr___inout); }))) {
            mixin(enumMixinStr___inout);
        }
    }
    static if(!is(typeof(__out_nz_opt))) {
        private enum enumMixinStr___out_nz_opt = `enum __out_nz_opt = _SAL1_Source_ ( __out_nz_opt , ( ) , __post __valid __refparam __post_except_maybenull_ );`;
        static if(is(typeof({ mixin(enumMixinStr___out_nz_opt); }))) {
            mixin(enumMixinStr___out_nz_opt);
        }
    }




    static if(!is(typeof(__out_nz))) {
        private enum enumMixinStr___out_nz = `enum __out_nz = _SAL1_Source_ ( __out_nz , ( ) , __post __valid __refparam );`;
        static if(is(typeof({ mixin(enumMixinStr___out_nz); }))) {
            mixin(enumMixinStr___out_nz);
        }
    }
    static if(!is(typeof(__out_z_opt))) {
        private enum enumMixinStr___out_z_opt = `enum __out_z_opt = _SAL1_Source_ ( __out_z_opt , ( ) , __post __valid __refparam __post _SAL1_Source_ ( __nullterminated , ( ) , _Null_terminated_ ) __pre_except_maybenull );`;
        static if(is(typeof({ mixin(enumMixinStr___out_z_opt); }))) {
            mixin(enumMixinStr___out_z_opt);
        }
    }




    static if(!is(typeof(__out_z))) {
        private enum enumMixinStr___out_z = `enum __out_z = _SAL1_Source_ ( __out_z , ( ) , __post __valid __refparam __post _SAL1_Source_ ( __nullterminated , ( ) , _Null_terminated_ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___out_z); }))) {
            mixin(enumMixinStr___out_z);
        }
    }
    static if(!is(typeof(__out))) {
        private enum enumMixinStr___out = `enum __out = _SAL1_Source_ ( __out , ( ) , _Out_ );`;
        static if(is(typeof({ mixin(enumMixinStr___out); }))) {
            mixin(enumMixinStr___out);
        }
    }
    static if(!is(typeof(__in_nz))) {
        private enum enumMixinStr___in_nz = `enum __in_nz = _SAL1_Source_ ( __in_nz , ( ) , __in );`;
        static if(is(typeof({ mixin(enumMixinStr___in_nz); }))) {
            mixin(enumMixinStr___in_nz);
        }
    }
    static if(!is(typeof(__in_z))) {
        private enum enumMixinStr___in_z = `enum __in_z = _SAL1_Source_ ( __in_z , ( ) , _In_z_ );`;
        static if(is(typeof({ mixin(enumMixinStr___in_z); }))) {
            mixin(enumMixinStr___in_z);
        }
    }
    static if(!is(typeof(__in))) {
        private enum enumMixinStr___in = `enum __in = _SAL1_Source_ ( __in , ( ) , _In_ );`;
        static if(is(typeof({ mixin(enumMixinStr___in); }))) {
            mixin(enumMixinStr___in);
        }
    }
    static if(!is(typeof(__nothrow))) {
        private enum enumMixinStr___nothrow = `enum __nothrow = __declspec ( nothrow );`;
        static if(is(typeof({ mixin(enumMixinStr___nothrow); }))) {
            mixin(enumMixinStr___nothrow);
        }
    }
    static if(!is(typeof(_SAL_nop_impl_))) {
        private enum enumMixinStr__SAL_nop_impl_ = `enum _SAL_nop_impl_ = X;`;
        static if(is(typeof({ mixin(enumMixinStr__SAL_nop_impl_); }))) {
            mixin(enumMixinStr__SAL_nop_impl_);
        }
    }
    static if(!is(typeof(_Deref_inout_z_))) {
        private enum enumMixinStr__Deref_inout_z_ = `enum _Deref_inout_z_ = _SAL1_1_Source_ ( _Deref_inout_z_ , ( ) , _Deref_prepost_z_ );`;
        static if(is(typeof({ mixin(enumMixinStr__Deref_inout_z_); }))) {
            mixin(enumMixinStr__Deref_inout_z_);
        }
    }
    static if(!is(typeof(_Deref_prepost_opt_valid_))) {
        private enum enumMixinStr__Deref_prepost_opt_valid_ = `enum _Deref_prepost_opt_valid_ = _SAL1_1_Source_ ( _Deref_prepost_opt_valid_ , ( ) , _Deref_pre_opt_valid_ _Deref_post_opt_valid_ );`;
        static if(is(typeof({ mixin(enumMixinStr__Deref_prepost_opt_valid_); }))) {
            mixin(enumMixinStr__Deref_prepost_opt_valid_);
        }
    }




    static if(!is(typeof(_Deref_prepost_valid_))) {
        private enum enumMixinStr__Deref_prepost_valid_ = `enum _Deref_prepost_valid_ = _SAL1_1_Source_ ( _Deref_prepost_valid_ , ( ) , _Deref_pre_valid_ _Deref_post_valid_ );`;
        static if(is(typeof({ mixin(enumMixinStr__Deref_prepost_valid_); }))) {
            mixin(enumMixinStr__Deref_prepost_valid_);
        }
    }
    static if(!is(typeof(_Deref_prepost_opt_z_))) {
        private enum enumMixinStr__Deref_prepost_opt_z_ = `enum _Deref_prepost_opt_z_ = _SAL1_1_Source_ ( _Deref_prepost_opt_z_ , ( ) , _Deref_pre_opt_z_ _Deref_post_opt_z_ );`;
        static if(is(typeof({ mixin(enumMixinStr__Deref_prepost_opt_z_); }))) {
            mixin(enumMixinStr__Deref_prepost_opt_z_);
        }
    }




    static if(!is(typeof(_Deref_prepost_z_))) {
        private enum enumMixinStr__Deref_prepost_z_ = `enum _Deref_prepost_z_ = _SAL1_1_Source_ ( _Deref_prepost_z_ , ( ) , _Deref_pre_z_ _Deref_post_z_ );`;
        static if(is(typeof({ mixin(enumMixinStr__Deref_prepost_z_); }))) {
            mixin(enumMixinStr__Deref_prepost_z_);
        }
    }




    static if(!is(typeof(_Prepost_opt_valid_))) {
        private enum enumMixinStr__Prepost_opt_valid_ = `enum _Prepost_opt_valid_ = _SAL1_1_Source_ ( _Prepost_opt_valid_ , ( ) , _Pre_opt_valid_ _Post_valid_ );`;
        static if(is(typeof({ mixin(enumMixinStr__Prepost_opt_valid_); }))) {
            mixin(enumMixinStr__Prepost_opt_valid_);
        }
    }




    static if(!is(typeof(_Prepost_valid_))) {
        private enum enumMixinStr__Prepost_valid_ = `enum _Prepost_valid_ = _SAL1_1_Source_ ( _Prepost_valid_ , ( ) , _Pre_valid_ _Post_valid_ );`;
        static if(is(typeof({ mixin(enumMixinStr__Prepost_valid_); }))) {
            mixin(enumMixinStr__Prepost_valid_);
        }
    }
    static if(!is(typeof(_Prepost_opt_z_))) {
        private enum enumMixinStr__Prepost_opt_z_ = `enum _Prepost_opt_z_ = _SAL1_1_Source_ ( _Prepost_opt_z_ , ( ) , _Pre_opt_z_ _Post_z_ );`;
        static if(is(typeof({ mixin(enumMixinStr__Prepost_opt_z_); }))) {
            mixin(enumMixinStr__Prepost_opt_z_);
        }
    }
    static if(!is(typeof(_Post_maybez_))) {
        private enum enumMixinStr__Post_maybez_ = `enum _Post_maybez_ = _SAL_L_Source_ ( _Post_maybez_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__Post_maybez_); }))) {
            mixin(enumMixinStr__Post_maybez_);
        }
    }
    static if(!is(typeof(_Pre_opt_cap_c_one_))) {
        private enum enumMixinStr__Pre_opt_cap_c_one_ = `enum _Pre_opt_cap_c_one_ = _SAL1_1_Source_ ( _Pre_opt_cap_c_one_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__Pre_opt_cap_c_one_); }))) {
            mixin(enumMixinStr__Pre_opt_cap_c_one_);
        }
    }




    static if(!is(typeof(_Pre_cap_c_one_))) {
        private enum enumMixinStr__Pre_cap_c_one_ = `enum _Pre_cap_c_one_ = _SAL1_1_Source_ ( _Pre_cap_c_one_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__Pre_cap_c_one_); }))) {
            mixin(enumMixinStr__Pre_cap_c_one_);
        }
    }
    static if(!is(typeof(_Pre_writeonly_))) {
        private enum enumMixinStr__Pre_writeonly_ = `enum _Pre_writeonly_ = _SAL1_1_Source_ ( _Pre_writeonly_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__Pre_writeonly_); }))) {
            mixin(enumMixinStr__Pre_writeonly_);
        }
    }




    static if(!is(typeof(_Pre_readonly_))) {
        private enum enumMixinStr__Pre_readonly_ = `enum _Pre_readonly_ = _SAL1_1_Source_ ( _Pre_readonly_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__Pre_readonly_); }))) {
            mixin(enumMixinStr__Pre_readonly_);
        }
    }




    static if(!is(typeof(_Pre_opt_z_))) {
        private enum enumMixinStr__Pre_opt_z_ = `enum _Pre_opt_z_ = _SAL1_1_Source_ ( _Pre_opt_z_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__Pre_opt_z_); }))) {
            mixin(enumMixinStr__Pre_opt_z_);
        }
    }
    static if(!is(typeof(_Ret_opt_z_))) {
        private enum enumMixinStr__Ret_opt_z_ = `enum _Ret_opt_z_ = _SAL1_1_Source_ ( _Ret_opt_z_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__Ret_opt_z_); }))) {
            mixin(enumMixinStr__Ret_opt_z_);
        }
    }




    static if(!is(typeof(_Ret_opt_valid_))) {
        private enum enumMixinStr__Ret_opt_valid_ = `enum _Ret_opt_valid_ = _SAL1_1_Source_ ( _Ret_opt_valid_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__Ret_opt_valid_); }))) {
            mixin(enumMixinStr__Ret_opt_valid_);
        }
    }




    static if(!is(typeof(_Deref2_pre_readonly_))) {
        private enum enumMixinStr__Deref2_pre_readonly_ = `enum _Deref2_pre_readonly_ = _SAL1_1_Source_ ( _Deref2_pre_readonly_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__Deref2_pre_readonly_); }))) {
            mixin(enumMixinStr__Deref2_pre_readonly_);
        }
    }




    static if(!is(typeof(_Deref_ret_opt_z_))) {
        private enum enumMixinStr__Deref_ret_opt_z_ = `enum _Deref_ret_opt_z_ = _SAL1_1_Source_ ( _Deref_ret_opt_z_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__Deref_ret_opt_z_); }))) {
            mixin(enumMixinStr__Deref_ret_opt_z_);
        }
    }




    static if(!is(typeof(_Deref_ret_z_))) {
        private enum enumMixinStr__Deref_ret_z_ = `enum _Deref_ret_z_ = _SAL1_1_Source_ ( _Deref_ret_z_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__Deref_ret_z_); }))) {
            mixin(enumMixinStr__Deref_ret_z_);
        }
    }




    static if(!is(typeof(_Deref_post_null_))) {
        private enum enumMixinStr__Deref_post_null_ = `enum _Deref_post_null_ = _SAL1_1_Source_ ( _Deref_post_null_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__Deref_post_null_); }))) {
            mixin(enumMixinStr__Deref_post_null_);
        }
    }




    static if(!is(typeof(_Deref_post_maybenull_))) {
        private enum enumMixinStr__Deref_post_maybenull_ = `enum _Deref_post_maybenull_ = _SAL1_1_Source_ ( _Deref_post_maybenull_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__Deref_post_maybenull_); }))) {
            mixin(enumMixinStr__Deref_post_maybenull_);
        }
    }




    static if(!is(typeof(_Deref_post_notnull_))) {
        private enum enumMixinStr__Deref_post_notnull_ = `enum _Deref_post_notnull_ = _SAL1_1_Source_ ( _Deref_post_notnull_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__Deref_post_notnull_); }))) {
            mixin(enumMixinStr__Deref_post_notnull_);
        }
    }




    static if(!is(typeof(_Deref_post_opt_valid_))) {
        private enum enumMixinStr__Deref_post_opt_valid_ = `enum _Deref_post_opt_valid_ = _SAL1_1_Source_ ( _Deref_post_opt_valid_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__Deref_post_opt_valid_); }))) {
            mixin(enumMixinStr__Deref_post_opt_valid_);
        }
    }




    static if(!is(typeof(_Deref_post_valid_))) {
        private enum enumMixinStr__Deref_post_valid_ = `enum _Deref_post_valid_ = _SAL1_1_Source_ ( _Deref_post_valid_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__Deref_post_valid_); }))) {
            mixin(enumMixinStr__Deref_post_valid_);
        }
    }
    static if(!is(typeof(_Deref_post_opt_z_))) {
        private enum enumMixinStr__Deref_post_opt_z_ = `enum _Deref_post_opt_z_ = _SAL1_1_Source_ ( _Deref_post_opt_z_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__Deref_post_opt_z_); }))) {
            mixin(enumMixinStr__Deref_post_opt_z_);
        }
    }




    static if(!is(typeof(_Deref_post_z_))) {
        private enum enumMixinStr__Deref_post_z_ = `enum _Deref_post_z_ = _SAL1_1_Source_ ( _Deref_post_z_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__Deref_post_z_); }))) {
            mixin(enumMixinStr__Deref_post_z_);
        }
    }




    static if(!is(typeof(_Deref_pre_writeonly_))) {
        private enum enumMixinStr__Deref_pre_writeonly_ = `enum _Deref_pre_writeonly_ = _SAL1_1_Source_ ( _Deref_pre_writeonly_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__Deref_pre_writeonly_); }))) {
            mixin(enumMixinStr__Deref_pre_writeonly_);
        }
    }




    static if(!is(typeof(_Deref_pre_readonly_))) {
        private enum enumMixinStr__Deref_pre_readonly_ = `enum _Deref_pre_readonly_ = _SAL1_1_Source_ ( _Deref_pre_readonly_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__Deref_pre_readonly_); }))) {
            mixin(enumMixinStr__Deref_pre_readonly_);
        }
    }




    static if(!is(typeof(_Deref_pre_null_))) {
        private enum enumMixinStr__Deref_pre_null_ = `enum _Deref_pre_null_ = _SAL1_1_Source_ ( _Deref_pre_null_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__Deref_pre_null_); }))) {
            mixin(enumMixinStr__Deref_pre_null_);
        }
    }




    static if(!is(typeof(_Deref_pre_maybenull_))) {
        private enum enumMixinStr__Deref_pre_maybenull_ = `enum _Deref_pre_maybenull_ = _SAL1_1_Source_ ( _Deref_pre_maybenull_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__Deref_pre_maybenull_); }))) {
            mixin(enumMixinStr__Deref_pre_maybenull_);
        }
    }




    static if(!is(typeof(_Deref_pre_notnull_))) {
        private enum enumMixinStr__Deref_pre_notnull_ = `enum _Deref_pre_notnull_ = _SAL1_1_Source_ ( _Deref_pre_notnull_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__Deref_pre_notnull_); }))) {
            mixin(enumMixinStr__Deref_pre_notnull_);
        }
    }




    static if(!is(typeof(_Deref_pre_invalid_))) {
        private enum enumMixinStr__Deref_pre_invalid_ = `enum _Deref_pre_invalid_ = _SAL1_1_Source_ ( _Deref_pre_invalid_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__Deref_pre_invalid_); }))) {
            mixin(enumMixinStr__Deref_pre_invalid_);
        }
    }




    static if(!is(typeof(_Deref_pre_opt_valid_))) {
        private enum enumMixinStr__Deref_pre_opt_valid_ = `enum _Deref_pre_opt_valid_ = _SAL1_1_Source_ ( _Deref_pre_opt_valid_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__Deref_pre_opt_valid_); }))) {
            mixin(enumMixinStr__Deref_pre_opt_valid_);
        }
    }




    static if(!is(typeof(_Deref_pre_valid_))) {
        private enum enumMixinStr__Deref_pre_valid_ = `enum _Deref_pre_valid_ = _SAL1_1_Source_ ( _Deref_pre_valid_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__Deref_pre_valid_); }))) {
            mixin(enumMixinStr__Deref_pre_valid_);
        }
    }
    static if(!is(typeof(_Deref_pre_opt_z_))) {
        private enum enumMixinStr__Deref_pre_opt_z_ = `enum _Deref_pre_opt_z_ = _SAL1_1_Source_ ( _Deref_pre_opt_z_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__Deref_pre_opt_z_); }))) {
            mixin(enumMixinStr__Deref_pre_opt_z_);
        }
    }




    static if(!is(typeof(_Deref_pre_z_))) {
        private enum enumMixinStr__Deref_pre_z_ = `enum _Deref_pre_z_ = _SAL1_1_Source_ ( _Deref_pre_z_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__Deref_pre_z_); }))) {
            mixin(enumMixinStr__Deref_pre_z_);
        }
    }




    static if(!is(typeof(_Deref_opt_out_opt_z_))) {
        private enum enumMixinStr__Deref_opt_out_opt_z_ = `enum _Deref_opt_out_opt_z_ = _SAL1_1_Source_ ( _Deref_opt_out_opt_z_ , ( ) , _Out_opt_ _SAL1_1_Source_ ( _Deref_post_opt_z_ , ( ) , ) );`;
        static if(is(typeof({ mixin(enumMixinStr__Deref_opt_out_opt_z_); }))) {
            mixin(enumMixinStr__Deref_opt_out_opt_z_);
        }
    }




    static if(!is(typeof(_Deref_opt_out_z_))) {
        private enum enumMixinStr__Deref_opt_out_z_ = `enum _Deref_opt_out_z_ = _SAL1_1_Source_ ( _Deref_opt_out_z_ , ( ) , _Out_opt_ _SAL1_1_Source_ ( _Deref_post_z_ , ( ) , ) );`;
        static if(is(typeof({ mixin(enumMixinStr__Deref_opt_out_z_); }))) {
            mixin(enumMixinStr__Deref_opt_out_z_);
        }
    }




    static if(!is(typeof(_Deref_out_opt_z_))) {
        private enum enumMixinStr__Deref_out_opt_z_ = `enum _Deref_out_opt_z_ = _SAL1_1_Source_ ( _Deref_out_opt_z_ , ( ) , _Out_ _SAL1_1_Source_ ( _Deref_post_opt_z_ , ( ) , ) );`;
        static if(is(typeof({ mixin(enumMixinStr__Deref_out_opt_z_); }))) {
            mixin(enumMixinStr__Deref_out_opt_z_);
        }
    }




    static if(!is(typeof(_Deref_out_z_))) {
        private enum enumMixinStr__Deref_out_z_ = `enum _Deref_out_z_ = _SAL1_1_Source_ ( _Deref_out_z_ , ( ) , _Out_ _SAL1_1_Source_ ( _Deref_post_z_ , ( ) , ) );`;
        static if(is(typeof({ mixin(enumMixinStr__Deref_out_z_); }))) {
            mixin(enumMixinStr__Deref_out_z_);
        }
    }




    static if(!is(typeof(_Deref_opt_out_opt_))) {
        private enum enumMixinStr__Deref_opt_out_opt_ = `enum _Deref_opt_out_opt_ = _SAL1_1_Source_ ( _Deref_opt_out_opt_ , ( ) , _Out_opt_ _SAL1_1_Source_ ( _Deref_post_opt_valid_ , ( ) , ) );`;
        static if(is(typeof({ mixin(enumMixinStr__Deref_opt_out_opt_); }))) {
            mixin(enumMixinStr__Deref_opt_out_opt_);
        }
    }




    static if(!is(typeof(_Deref_opt_out_))) {
        private enum enumMixinStr__Deref_opt_out_ = `enum _Deref_opt_out_ = _SAL1_1_Source_ ( _Deref_opt_out_ , ( ) , _Out_opt_ _SAL1_1_Source_ ( _Deref_post_valid_ , ( ) , ) );`;
        static if(is(typeof({ mixin(enumMixinStr__Deref_opt_out_); }))) {
            mixin(enumMixinStr__Deref_opt_out_);
        }
    }




    static if(!is(typeof(_Deref_out_opt_))) {
        private enum enumMixinStr__Deref_out_opt_ = `enum _Deref_out_opt_ = _SAL1_1_Source_ ( _Deref_out_opt_ , ( ) , _Out_ _SAL1_1_Source_ ( _Deref_post_opt_valid_ , ( ) , ) );`;
        static if(is(typeof({ mixin(enumMixinStr__Deref_out_opt_); }))) {
            mixin(enumMixinStr__Deref_out_opt_);
        }
    }




    static if(!is(typeof(_Deref_out_))) {
        private enum enumMixinStr__Deref_out_ = `enum _Deref_out_ = _SAL1_1_Source_ ( _Deref_out_ , ( ) , _Out_ _SAL1_1_Source_ ( _Deref_post_valid_ , ( ) , ) );`;
        static if(is(typeof({ mixin(enumMixinStr__Deref_out_); }))) {
            mixin(enumMixinStr__Deref_out_);
        }
    }




    static if(!is(typeof(_Deref_ret_bound_))) {
        private enum enumMixinStr__Deref_ret_bound_ = `enum _Deref_ret_bound_ = _SAL1_1_Source_ ( _Deref_ret_bound_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__Deref_ret_bound_); }))) {
            mixin(enumMixinStr__Deref_ret_bound_);
        }
    }




    static if(!is(typeof(_Deref_inout_bound_))) {
        private enum enumMixinStr__Deref_inout_bound_ = `enum _Deref_inout_bound_ = _SAL1_1_Source_ ( _Deref_inout_bound_ , ( ) , _Deref_in_bound_ _Deref_out_bound_ );`;
        static if(is(typeof({ mixin(enumMixinStr__Deref_inout_bound_); }))) {
            mixin(enumMixinStr__Deref_inout_bound_);
        }
    }




    static if(!is(typeof(_Deref_out_bound_))) {
        private enum enumMixinStr__Deref_out_bound_ = `enum _Deref_out_bound_ = _SAL1_1_Source_ ( _Deref_out_bound_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__Deref_out_bound_); }))) {
            mixin(enumMixinStr__Deref_out_bound_);
        }
    }




    static if(!is(typeof(_Deref_in_bound_))) {
        private enum enumMixinStr__Deref_in_bound_ = `enum _Deref_in_bound_ = _SAL1_1_Source_ ( _Deref_in_bound_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__Deref_in_bound_); }))) {
            mixin(enumMixinStr__Deref_in_bound_);
        }
    }




    static if(!is(typeof(_Ret_bound_))) {
        private enum enumMixinStr__Ret_bound_ = `enum _Ret_bound_ = _SAL1_1_Source_ ( _Ret_bound_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__Ret_bound_); }))) {
            mixin(enumMixinStr__Ret_bound_);
        }
    }




    static if(!is(typeof(_Out_bound_))) {
        private enum enumMixinStr__Out_bound_ = `enum _Out_bound_ = _SAL1_1_Source_ ( _Out_bound_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__Out_bound_); }))) {
            mixin(enumMixinStr__Out_bound_);
        }
    }




    static if(!is(typeof(_In_bound_))) {
        private enum enumMixinStr__In_bound_ = `enum _In_bound_ = _SAL1_1_Source_ ( _In_bound_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__In_bound_); }))) {
            mixin(enumMixinStr__In_bound_);
        }
    }




    static if(!is(typeof(_Ret_opt_))) {
        private enum enumMixinStr__Ret_opt_ = `enum _Ret_opt_ = _SAL1_1_Source_ ( _Ret_opt_ , ( ) , _SAL1_1_Source_ ( _Ret_opt_valid_ , ( ) , ) );`;
        static if(is(typeof({ mixin(enumMixinStr__Ret_opt_); }))) {
            mixin(enumMixinStr__Ret_opt_);
        }
    }




    static if(!is(typeof(_Ret_))) {
        private enum enumMixinStr__Ret_ = `enum _Ret_ = _SAL1_1_Source_ ( _Ret_ , ( ) , _Ret_valid_ );`;
        static if(is(typeof({ mixin(enumMixinStr__Ret_); }))) {
            mixin(enumMixinStr__Ret_);
        }
    }
    static if(!is(typeof(_Prepost_z_))) {
        private enum enumMixinStr__Prepost_z_ = `enum _Prepost_z_ = _SAL2_Source_ ( _Prepost_z_ , ( ) , _Pre_z_ _Post_z_ );`;
        static if(is(typeof({ mixin(enumMixinStr__Prepost_z_); }))) {
            mixin(enumMixinStr__Prepost_z_);
        }
    }




    static if(!is(typeof(_Post_maybenull_))) {
        private enum enumMixinStr__Post_maybenull_ = `enum _Post_maybenull_ = _SAL2_Source_ ( _Post_maybenull_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__Post_maybenull_); }))) {
            mixin(enumMixinStr__Post_maybenull_);
        }
    }




    static if(!is(typeof(_Post_null_))) {
        private enum enumMixinStr__Post_null_ = `enum _Post_null_ = _SAL2_Source_ ( _Post_null_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__Post_null_); }))) {
            mixin(enumMixinStr__Post_null_);
        }
    }




    static if(!is(typeof(_Post_notnull_))) {
        private enum enumMixinStr__Post_notnull_ = `enum _Post_notnull_ = _SAL2_Source_ ( _Post_notnull_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__Post_notnull_); }))) {
            mixin(enumMixinStr__Post_notnull_);
        }
    }




    static if(!is(typeof(_Post_ptr_invalid_))) {
        private enum enumMixinStr__Post_ptr_invalid_ = `enum _Post_ptr_invalid_ = _SAL2_Source_ ( _Post_ptr_invalid_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__Post_ptr_invalid_); }))) {
            mixin(enumMixinStr__Post_ptr_invalid_);
        }
    }




    static if(!is(typeof(_Post_invalid_))) {
        private enum enumMixinStr__Post_invalid_ = `enum _Post_invalid_ = _SAL2_Source_ ( _Post_invalid_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__Post_invalid_); }))) {
            mixin(enumMixinStr__Post_invalid_);
        }
    }




    static if(!is(typeof(_Post_valid_))) {
        private enum enumMixinStr__Post_valid_ = `enum _Post_valid_ = _SAL2_Source_ ( _Post_valid_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__Post_valid_); }))) {
            mixin(enumMixinStr__Post_valid_);
        }
    }




    static if(!is(typeof(_Post_z_))) {
        private enum enumMixinStr__Post_z_ = `enum _Post_z_ = _SAL2_Source_ ( _Post_z_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__Post_z_); }))) {
            mixin(enumMixinStr__Post_z_);
        }
    }




    static if(!is(typeof(_Pre_null_))) {
        private enum enumMixinStr__Pre_null_ = `enum _Pre_null_ = _SAL2_Source_ ( _Pre_null_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__Pre_null_); }))) {
            mixin(enumMixinStr__Pre_null_);
        }
    }




    static if(!is(typeof(_Pre_maybenull_))) {
        private enum enumMixinStr__Pre_maybenull_ = `enum _Pre_maybenull_ = _SAL2_Source_ ( _Pre_maybenull_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__Pre_maybenull_); }))) {
            mixin(enumMixinStr__Pre_maybenull_);
        }
    }




    static if(!is(typeof(_Pre_notnull_))) {
        private enum enumMixinStr__Pre_notnull_ = `enum _Pre_notnull_ = _SAL2_Source_ ( _Pre_notnull_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__Pre_notnull_); }))) {
            mixin(enumMixinStr__Pre_notnull_);
        }
    }




    static if(!is(typeof(_Pre_unknown_))) {
        private enum enumMixinStr__Pre_unknown_ = `enum _Pre_unknown_ = _SAL2_Source_ ( _Pre_unknown_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__Pre_unknown_); }))) {
            mixin(enumMixinStr__Pre_unknown_);
        }
    }




    static if(!is(typeof(_Pre_invalid_))) {
        private enum enumMixinStr__Pre_invalid_ = `enum _Pre_invalid_ = _SAL2_Source_ ( _Pre_invalid_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__Pre_invalid_); }))) {
            mixin(enumMixinStr__Pre_invalid_);
        }
    }




    static if(!is(typeof(_Pre_opt_valid_))) {
        private enum enumMixinStr__Pre_opt_valid_ = `enum _Pre_opt_valid_ = _SAL2_Source_ ( _Pre_opt_valid_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__Pre_opt_valid_); }))) {
            mixin(enumMixinStr__Pre_opt_valid_);
        }
    }




    static if(!is(typeof(_Pre_valid_))) {
        private enum enumMixinStr__Pre_valid_ = `enum _Pre_valid_ = _SAL2_Source_ ( _Pre_valid_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__Pre_valid_); }))) {
            mixin(enumMixinStr__Pre_valid_);
        }
    }




    static if(!is(typeof(_Pre_z_))) {
        private enum enumMixinStr__Pre_z_ = `enum _Pre_z_ = _SAL2_Source_ ( _Pre_z_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__Pre_z_); }))) {
            mixin(enumMixinStr__Pre_z_);
        }
    }




    static if(!is(typeof(_Maybenull_))) {
        private enum enumMixinStr__Maybenull_ = `enum _Maybenull_ = _SAL2_Source_ ( _Maybenull_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__Maybenull_); }))) {
            mixin(enumMixinStr__Maybenull_);
        }
    }




    static if(!is(typeof(_Notnull_))) {
        private enum enumMixinStr__Notnull_ = `enum _Notnull_ = _SAL2_Source_ ( _Notnull_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__Notnull_); }))) {
            mixin(enumMixinStr__Notnull_);
        }
    }




    static if(!is(typeof(_Null_))) {
        private enum enumMixinStr__Null_ = `enum _Null_ = _SAL2_Source_ ( _Null_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__Null_); }))) {
            mixin(enumMixinStr__Null_);
        }
    }
    static if(!is(typeof(_NullNull_terminated_))) {
        private enum enumMixinStr__NullNull_terminated_ = `enum _NullNull_terminated_ = _SAL2_Source_ ( _NullNull_terminated_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__NullNull_terminated_); }))) {
            mixin(enumMixinStr__NullNull_terminated_);
        }
    }




    static if(!is(typeof(_Null_terminated_))) {
        private enum enumMixinStr__Null_terminated_ = `enum _Null_terminated_ = _SAL2_Source_ ( _Null_terminated_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__Null_terminated_); }))) {
            mixin(enumMixinStr__Null_terminated_);
        }
    }
    static if(!is(typeof(_Maybevalid_))) {
        private enum enumMixinStr__Maybevalid_ = `enum _Maybevalid_ = ;`;
        static if(is(typeof({ mixin(enumMixinStr__Maybevalid_); }))) {
            mixin(enumMixinStr__Maybevalid_);
        }
    }




    static if(!is(typeof(_Notvalid_))) {
        private enum enumMixinStr__Notvalid_ = `enum _Notvalid_ = ;`;
        static if(is(typeof({ mixin(enumMixinStr__Notvalid_); }))) {
            mixin(enumMixinStr__Notvalid_);
        }
    }




    static if(!is(typeof(_Valid_))) {
        private enum enumMixinStr__Valid_ = `enum _Valid_ = ;`;
        static if(is(typeof({ mixin(enumMixinStr__Valid_); }))) {
            mixin(enumMixinStr__Valid_);
        }
    }




    static if(!is(typeof(_Post_))) {
        private enum enumMixinStr__Post_ = `enum _Post_ = ;`;
        static if(is(typeof({ mixin(enumMixinStr__Post_); }))) {
            mixin(enumMixinStr__Post_);
        }
    }




    static if(!is(typeof(_Pre_))) {
        private enum enumMixinStr__Pre_ = `enum _Pre_ = ;`;
        static if(is(typeof({ mixin(enumMixinStr__Pre_); }))) {
            mixin(enumMixinStr__Pre_);
        }
    }






    static if(!is(typeof(_Field_z_))) {
        private enum enumMixinStr__Field_z_ = `enum _Field_z_ = _SAL2_Source_ ( _Field_z_ , ( ) , _SAL2_Source_ ( _Null_terminated_ , ( ) , ) );`;
        static if(is(typeof({ mixin(enumMixinStr__Field_z_); }))) {
            mixin(enumMixinStr__Field_z_);
        }
    }
    static if(!is(typeof(_Scanf_s_format_string_))) {
        private enum enumMixinStr__Scanf_s_format_string_ = `enum _Scanf_s_format_string_ = _SAL2_Source_ ( _Scanf_s_format_string_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__Scanf_s_format_string_); }))) {
            mixin(enumMixinStr__Scanf_s_format_string_);
        }
    }




    static if(!is(typeof(_Scanf_format_string_))) {
        private enum enumMixinStr__Scanf_format_string_ = `enum _Scanf_format_string_ = _SAL2_Source_ ( _Scanf_format_string_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__Scanf_format_string_); }))) {
            mixin(enumMixinStr__Scanf_format_string_);
        }
    }




    static if(!is(typeof(_Printf_format_string_))) {
        private enum enumMixinStr__Printf_format_string_ = `enum _Printf_format_string_ = _SAL2_Source_ ( _Printf_format_string_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__Printf_format_string_); }))) {
            mixin(enumMixinStr__Printf_format_string_);
        }
    }




    static if(!is(typeof(_Must_inspect_result_))) {
        private enum enumMixinStr__Must_inspect_result_ = `enum _Must_inspect_result_ = _SAL2_Source_ ( _Must_inspect_result_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__Must_inspect_result_); }))) {
            mixin(enumMixinStr__Must_inspect_result_);
        }
    }




    static if(!is(typeof(_Check_return_))) {
        private enum enumMixinStr__Check_return_ = `enum _Check_return_ = _SAL2_Source_ ( _Check_return_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__Check_return_); }))) {
            mixin(enumMixinStr__Check_return_);
        }
    }




    static if(!is(typeof(_Notliteral_))) {
        private enum enumMixinStr__Notliteral_ = `enum _Notliteral_ = _SAL2_Source_ ( _Notliteral_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__Notliteral_); }))) {
            mixin(enumMixinStr__Notliteral_);
        }
    }




    static if(!is(typeof(_Literal_))) {
        private enum enumMixinStr__Literal_ = `enum _Literal_ = _SAL2_Source_ ( _Literal_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__Literal_); }))) {
            mixin(enumMixinStr__Literal_);
        }
    }




    static if(!is(typeof(_Points_to_data_))) {
        private enum enumMixinStr__Points_to_data_ = `enum _Points_to_data_ = _SAL2_Source_ ( _Points_to_data_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__Points_to_data_); }))) {
            mixin(enumMixinStr__Points_to_data_);
        }
    }
    static if(!is(typeof(_Ret_valid_))) {
        private enum enumMixinStr__Ret_valid_ = `enum _Ret_valid_ = _SAL2_Source_ ( _Ret_valid_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__Ret_valid_); }))) {
            mixin(enumMixinStr__Ret_valid_);
        }
    }




    static if(!is(typeof(_Ret_null_))) {
        private enum enumMixinStr__Ret_null_ = `enum _Ret_null_ = _SAL2_Source_ ( _Ret_null_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__Ret_null_); }))) {
            mixin(enumMixinStr__Ret_null_);
        }
    }




    static if(!is(typeof(_Ret_maybenull_))) {
        private enum enumMixinStr__Ret_maybenull_ = `enum _Ret_maybenull_ = _SAL2_Source_ ( _Ret_maybenull_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__Ret_maybenull_); }))) {
            mixin(enumMixinStr__Ret_maybenull_);
        }
    }




    static if(!is(typeof(_Ret_notnull_))) {
        private enum enumMixinStr__Ret_notnull_ = `enum _Ret_notnull_ = _SAL2_Source_ ( _Ret_notnull_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__Ret_notnull_); }))) {
            mixin(enumMixinStr__Ret_notnull_);
        }
    }




    static if(!is(typeof(_Ret_maybenull_z_))) {
        private enum enumMixinStr__Ret_maybenull_z_ = `enum _Ret_maybenull_z_ = _SAL2_Source_ ( _Ret_maybenull_z_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__Ret_maybenull_z_); }))) {
            mixin(enumMixinStr__Ret_maybenull_z_);
        }
    }




    static if(!is(typeof(_Ret_z_))) {
        private enum enumMixinStr__Ret_z_ = `enum _Ret_z_ = _SAL2_Source_ ( _Ret_z_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__Ret_z_); }))) {
            mixin(enumMixinStr__Ret_z_);
        }
    }




    static if(!is(typeof(_Result_zeroonfailure_))) {
        private enum enumMixinStr__Result_zeroonfailure_ = `enum _Result_zeroonfailure_ = _SAL2_Source_ ( _Result_zeroonfailure_ , ( ) , _On_failure_ ( _Deref_impl_ _SAL2_Source_ ( _Out_range_ , ( == , 0 ) , ) ) );`;
        static if(is(typeof({ mixin(enumMixinStr__Result_zeroonfailure_); }))) {
            mixin(enumMixinStr__Result_zeroonfailure_);
        }
    }




    static if(!is(typeof(_Result_nullonfailure_))) {
        private enum enumMixinStr__Result_nullonfailure_ = `enum _Result_nullonfailure_ = _SAL2_Source_ ( _Result_nullonfailure_ , ( ) , _On_failure_ ( _Deref_impl_ _SAL2_Source_ ( _Post_null_ , ( ) , ) ) );`;
        static if(is(typeof({ mixin(enumMixinStr__Result_nullonfailure_); }))) {
            mixin(enumMixinStr__Result_nullonfailure_);
        }
    }




    static if(!is(typeof(_Outref_result_nullonfailure_))) {
        private enum enumMixinStr__Outref_result_nullonfailure_ = `enum _Outref_result_nullonfailure_ = _SAL2_Source_ ( _Outref_result_nullonfailure_ , ( ) , _Outref_ _On_failure_ ( _SAL2_Source_ ( _Post_null_ , ( ) , ) ) );`;
        static if(is(typeof({ mixin(enumMixinStr__Outref_result_nullonfailure_); }))) {
            mixin(enumMixinStr__Outref_result_nullonfailure_);
        }
    }
    static if(!is(typeof(_Outref_result_maybenull_))) {
        private enum enumMixinStr__Outref_result_maybenull_ = `enum _Outref_result_maybenull_ = _SAL2_Source_ ( _Outref_result_maybenull_ , ( ) , _SAL2_Source_ ( _Post_maybenull_ , ( ) , ) );`;
        static if(is(typeof({ mixin(enumMixinStr__Outref_result_maybenull_); }))) {
            mixin(enumMixinStr__Outref_result_maybenull_);
        }
    }




    static if(!is(typeof(_Outref_))) {
        private enum enumMixinStr__Outref_ = `enum _Outref_ = _SAL2_Source_ ( _Outref_ , ( ) , _Out_impl_ _SAL2_Source_ ( _Post_notnull_ , ( ) , ) );`;
        static if(is(typeof({ mixin(enumMixinStr__Outref_); }))) {
            mixin(enumMixinStr__Outref_);
        }
    }
    static if(!is(typeof(_COM_Outptr_opt_result_maybenull_))) {
        private enum enumMixinStr__COM_Outptr_opt_result_maybenull_ = `enum _COM_Outptr_opt_result_maybenull_ = _SAL2_Source_ ( _COM_Outptr_opt_result_maybenull_ , ( ) , _Outptr_opt_result_maybenull_ _On_failure_ ( _SAL1_1_Source_ ( _Deref_post_null_ , ( ) , ) ) );`;
        static if(is(typeof({ mixin(enumMixinStr__COM_Outptr_opt_result_maybenull_); }))) {
            mixin(enumMixinStr__COM_Outptr_opt_result_maybenull_);
        }
    }




    static if(!is(typeof(_COM_Outptr_opt_))) {
        private enum enumMixinStr__COM_Outptr_opt_ = `enum _COM_Outptr_opt_ = _SAL2_Source_ ( _COM_Outptr_opt_ , ( ) , _Outptr_opt_ _On_failure_ ( _SAL1_1_Source_ ( _Deref_post_null_ , ( ) , ) ) );`;
        static if(is(typeof({ mixin(enumMixinStr__COM_Outptr_opt_); }))) {
            mixin(enumMixinStr__COM_Outptr_opt_);
        }
    }




    static if(!is(typeof(_COM_Outptr_result_maybenull_))) {
        private enum enumMixinStr__COM_Outptr_result_maybenull_ = `enum _COM_Outptr_result_maybenull_ = _SAL2_Source_ ( _COM_Outptr_result_maybenull_ , ( ) , _Outptr_result_maybenull_ _On_failure_ ( _SAL1_1_Source_ ( _Deref_post_null_ , ( ) , ) ) );`;
        static if(is(typeof({ mixin(enumMixinStr__COM_Outptr_result_maybenull_); }))) {
            mixin(enumMixinStr__COM_Outptr_result_maybenull_);
        }
    }




    static if(!is(typeof(_COM_Outptr_))) {
        private enum enumMixinStr__COM_Outptr_ = `enum _COM_Outptr_ = _SAL2_Source_ ( _COM_Outptr_ , ( ) , _Outptr_ _On_failure_ ( _SAL1_1_Source_ ( _Deref_post_null_ , ( ) , ) ) );`;
        static if(is(typeof({ mixin(enumMixinStr__COM_Outptr_); }))) {
            mixin(enumMixinStr__COM_Outptr_);
        }
    }




    static if(!is(typeof(_Outptr_opt_result_nullonfailure_))) {
        private enum enumMixinStr__Outptr_opt_result_nullonfailure_ = `enum _Outptr_opt_result_nullonfailure_ = _SAL2_Source_ ( _Outptr_opt_result_nullonfailure_ , ( ) , _Outptr_opt_ _On_failure_ ( _SAL1_1_Source_ ( _Deref_post_null_ , ( ) , ) ) );`;
        static if(is(typeof({ mixin(enumMixinStr__Outptr_opt_result_nullonfailure_); }))) {
            mixin(enumMixinStr__Outptr_opt_result_nullonfailure_);
        }
    }




    static if(!is(typeof(_Outptr_result_nullonfailure_))) {
        private enum enumMixinStr__Outptr_result_nullonfailure_ = `enum _Outptr_result_nullonfailure_ = _SAL2_Source_ ( _Outptr_result_nullonfailure_ , ( ) , _Outptr_ _On_failure_ ( _SAL1_1_Source_ ( _Deref_post_null_ , ( ) , ) ) );`;
        static if(is(typeof({ mixin(enumMixinStr__Outptr_result_nullonfailure_); }))) {
            mixin(enumMixinStr__Outptr_result_nullonfailure_);
        }
    }




    static if(!is(typeof(_Outptr_opt_result_maybenull_z_))) {
        private enum enumMixinStr__Outptr_opt_result_maybenull_z_ = `enum _Outptr_opt_result_maybenull_z_ = _SAL2_Source_ ( _Outptr_opt_result_maybenull_z_ , ( ) , _Out_opt_impl_ _SAL1_1_Source_ ( _Deref_post_opt_z_ , ( ) , ) );`;
        static if(is(typeof({ mixin(enumMixinStr__Outptr_opt_result_maybenull_z_); }))) {
            mixin(enumMixinStr__Outptr_opt_result_maybenull_z_);
        }
    }




    static if(!is(typeof(_Outptr_result_maybenull_z_))) {
        private enum enumMixinStr__Outptr_result_maybenull_z_ = `enum _Outptr_result_maybenull_z_ = _SAL2_Source_ ( _Outptr_result_maybenull_z_ , ( ) , _Out_impl_ _SAL1_1_Source_ ( _Deref_post_opt_z_ , ( ) , ) );`;
        static if(is(typeof({ mixin(enumMixinStr__Outptr_result_maybenull_z_); }))) {
            mixin(enumMixinStr__Outptr_result_maybenull_z_);
        }
    }




    static if(!is(typeof(_Outptr_opt_result_z_))) {
        private enum enumMixinStr__Outptr_opt_result_z_ = `enum _Outptr_opt_result_z_ = _SAL2_Source_ ( _Outptr_opt_result_z_ , ( ) , _Out_opt_impl_ _SAL1_1_Source_ ( _Deref_post_z_ , ( ) , ) );`;
        static if(is(typeof({ mixin(enumMixinStr__Outptr_opt_result_z_); }))) {
            mixin(enumMixinStr__Outptr_opt_result_z_);
        }
    }




    static if(!is(typeof(_Outptr_result_z_))) {
        private enum enumMixinStr__Outptr_result_z_ = `enum _Outptr_result_z_ = _SAL2_Source_ ( _Outptr_result_z_ , ( ) , _Out_impl_ _SAL1_1_Source_ ( _Deref_post_z_ , ( ) , ) );`;
        static if(is(typeof({ mixin(enumMixinStr__Outptr_result_z_); }))) {
            mixin(enumMixinStr__Outptr_result_z_);
        }
    }




    static if(!is(typeof(_Outptr_opt_result_maybenull_))) {
        private enum enumMixinStr__Outptr_opt_result_maybenull_ = `enum _Outptr_opt_result_maybenull_ = _SAL2_Source_ ( _Outptr_opt_result_maybenull_ , ( ) , _Out_opt_impl_ );`;
        static if(is(typeof({ mixin(enumMixinStr__Outptr_opt_result_maybenull_); }))) {
            mixin(enumMixinStr__Outptr_opt_result_maybenull_);
        }
    }




    static if(!is(typeof(_Outptr_opt_))) {
        private enum enumMixinStr__Outptr_opt_ = `enum _Outptr_opt_ = _SAL2_Source_ ( _Outptr_opt_ , ( ) , _Out_opt_impl_ );`;
        static if(is(typeof({ mixin(enumMixinStr__Outptr_opt_); }))) {
            mixin(enumMixinStr__Outptr_opt_);
        }
    }




    static if(!is(typeof(_Outptr_result_maybenull_))) {
        private enum enumMixinStr__Outptr_result_maybenull_ = `enum _Outptr_result_maybenull_ = _SAL2_Source_ ( _Outptr_result_maybenull_ , ( ) , _Out_impl_ );`;
        static if(is(typeof({ mixin(enumMixinStr__Outptr_result_maybenull_); }))) {
            mixin(enumMixinStr__Outptr_result_maybenull_);
        }
    }




    static if(!is(typeof(_Outptr_))) {
        private enum enumMixinStr__Outptr_ = `enum _Outptr_ = _SAL2_Source_ ( _Outptr_ , ( ) , _Out_impl_ );`;
        static if(is(typeof({ mixin(enumMixinStr__Outptr_); }))) {
            mixin(enumMixinStr__Outptr_);
        }
    }
    static if(!is(typeof(_Inout_opt_z_))) {
        private enum enumMixinStr__Inout_opt_z_ = `enum _Inout_opt_z_ = _SAL2_Source_ ( _Inout_opt_z_ , ( ) , _SAL1_1_Source_ ( _Prepost_opt_z_ , ( ) , _SAL1_1_Source_ ( _Pre_opt_z_ , ( ) , ) _SAL2_Source_ ( _Post_z_ , ( ) , ) ) );`;
        static if(is(typeof({ mixin(enumMixinStr__Inout_opt_z_); }))) {
            mixin(enumMixinStr__Inout_opt_z_);
        }
    }




    static if(!is(typeof(_Inout_z_))) {
        private enum enumMixinStr__Inout_z_ = `enum _Inout_z_ = _SAL2_Source_ ( _Inout_z_ , ( ) , _SAL2_Source_ ( _Prepost_z_ , ( ) , _SAL2_Source_ ( _Pre_z_ , ( ) , ) _SAL2_Source_ ( _Post_z_ , ( ) , ) ) );`;
        static if(is(typeof({ mixin(enumMixinStr__Inout_z_); }))) {
            mixin(enumMixinStr__Inout_z_);
        }
    }




    static if(!is(typeof(_Inout_opt_))) {
        private enum enumMixinStr__Inout_opt_ = `enum _Inout_opt_ = _SAL2_Source_ ( _Inout_opt_ , ( ) , _SAL1_1_Source_ ( _Prepost_opt_valid_ , ( ) , _SAL2_Source_ ( _Pre_opt_valid_ , ( ) , ) _SAL2_Source_ ( _Post_valid_ , ( ) , ) ) );`;
        static if(is(typeof({ mixin(enumMixinStr__Inout_opt_); }))) {
            mixin(enumMixinStr__Inout_opt_);
        }
    }




    static if(!is(typeof(_Inout_))) {
        private enum enumMixinStr__Inout_ = `enum _Inout_ = _SAL2_Source_ ( _Inout_ , ( ) , _SAL1_1_Source_ ( _Prepost_valid_ , ( ) , _SAL2_Source_ ( _Pre_valid_ , ( ) , ) _SAL2_Source_ ( _Post_valid_ , ( ) , ) ) );`;
        static if(is(typeof({ mixin(enumMixinStr__Inout_); }))) {
            mixin(enumMixinStr__Inout_);
        }
    }
    static if(!is(typeof(_Out_opt_))) {
        private enum enumMixinStr__Out_opt_ = `enum _Out_opt_ = _SAL2_Source_ ( _Out_opt_ , ( ) , _Out_opt_impl_ );`;
        static if(is(typeof({ mixin(enumMixinStr__Out_opt_); }))) {
            mixin(enumMixinStr__Out_opt_);
        }
    }




    static if(!is(typeof(_Out_))) {
        private enum enumMixinStr__Out_ = `enum _Out_ = _SAL2_Source_ ( _Out_ , ( ) , _Out_impl_ );`;
        static if(is(typeof({ mixin(enumMixinStr__Out_); }))) {
            mixin(enumMixinStr__Out_);
        }
    }
    static if(!is(typeof(_In_opt_z_))) {
        private enum enumMixinStr__In_opt_z_ = `enum _In_opt_z_ = _SAL2_Source_ ( _In_opt_z_ , ( ) , _In_opt_ );`;
        static if(is(typeof({ mixin(enumMixinStr__In_opt_z_); }))) {
            mixin(enumMixinStr__In_opt_z_);
        }
    }




    static if(!is(typeof(_In_z_))) {
        private enum enumMixinStr__In_z_ = `enum _In_z_ = _SAL2_Source_ ( _In_z_ , ( ) , _In_ );`;
        static if(is(typeof({ mixin(enumMixinStr__In_z_); }))) {
            mixin(enumMixinStr__In_z_);
        }
    }




    static if(!is(typeof(_In_opt_))) {
        private enum enumMixinStr__In_opt_ = `enum _In_opt_ = _SAL2_Source_ ( _In_opt_ , ( ) , _SAL1_1_Source_ ( _Deref_pre_readonly_ , ( ) , ) );`;
        static if(is(typeof({ mixin(enumMixinStr__In_opt_); }))) {
            mixin(enumMixinStr__In_opt_);
        }
    }




    static if(!is(typeof(_In_))) {
        private enum enumMixinStr__In_ = `enum _In_ = _SAL2_Source_ ( _In_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__In_); }))) {
            mixin(enumMixinStr__In_);
        }
    }




    static if(!is(typeof(_Const_))) {
        private enum enumMixinStr__Const_ = `enum _Const_ = _SAL2_Source_ ( _Const_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__Const_); }))) {
            mixin(enumMixinStr__Const_);
        }
    }




    static if(!is(typeof(_Reserved_))) {
        private enum enumMixinStr__Reserved_ = `enum _Reserved_ = _SAL2_Source_ ( _Reserved_ , ( ) , );`;
        static if(is(typeof({ mixin(enumMixinStr__Reserved_); }))) {
            mixin(enumMixinStr__Reserved_);
        }
    }
    static if(!is(typeof(_Post_defensive_))) {
        private enum enumMixinStr__Post_defensive_ = `enum _Post_defensive_ = ;`;
        static if(is(typeof({ mixin(enumMixinStr__Post_defensive_); }))) {
            mixin(enumMixinStr__Post_defensive_);
        }
    }




    static if(!is(typeof(_Pre_defensive_))) {
        private enum enumMixinStr__Pre_defensive_ = `enum _Pre_defensive_ = ;`;
        static if(is(typeof({ mixin(enumMixinStr__Pre_defensive_); }))) {
            mixin(enumMixinStr__Pre_defensive_);
        }
    }




    static if(!is(typeof(_Notref_))) {
        private enum enumMixinStr__Notref_ = `enum _Notref_ = ;`;
        static if(is(typeof({ mixin(enumMixinStr__Notref_); }))) {
            mixin(enumMixinStr__Notref_);
        }
    }




    static if(!is(typeof(_Use_decl_annotations_))) {
        private enum enumMixinStr__Use_decl_annotations_ = `enum _Use_decl_annotations_ = ;`;
        static if(is(typeof({ mixin(enumMixinStr__Use_decl_annotations_); }))) {
            mixin(enumMixinStr__Use_decl_annotations_);
        }
    }
    static if(!is(typeof(_USE_ATTRIBUTES_FOR_SAL))) {
        private enum enumMixinStr__USE_ATTRIBUTES_FOR_SAL = `enum _USE_ATTRIBUTES_FOR_SAL = 0;`;
        static if(is(typeof({ mixin(enumMixinStr__USE_ATTRIBUTES_FOR_SAL); }))) {
            mixin(enumMixinStr__USE_ATTRIBUTES_FOR_SAL);
        }
    }




    static if(!is(typeof(_USE_DECLSPECS_FOR_SAL))) {
        private enum enumMixinStr__USE_DECLSPECS_FOR_SAL = `enum _USE_DECLSPECS_FOR_SAL = 0;`;
        static if(is(typeof({ mixin(enumMixinStr__USE_DECLSPECS_FOR_SAL); }))) {
            mixin(enumMixinStr__USE_DECLSPECS_FOR_SAL);
        }
    }




    static if(!is(typeof(__SAL_H_VERSION))) {
        private enum enumMixinStr___SAL_H_VERSION = `enum __SAL_H_VERSION = 180000000;`;
        static if(is(typeof({ mixin(enumMixinStr___SAL_H_VERSION); }))) {
            mixin(enumMixinStr___SAL_H_VERSION);
        }
    }




    static if(!is(typeof(_SAL_VERSION))) {
        private enum enumMixinStr__SAL_VERSION = `enum _SAL_VERSION = 20;`;
        static if(is(typeof({ mixin(enumMixinStr__SAL_VERSION); }))) {
            mixin(enumMixinStr__SAL_VERSION);
        }
    }






    static if(!is(typeof(NO_COMPETING_THREAD_END))) {
        private enum enumMixinStr_NO_COMPETING_THREAD_END = `enum NO_COMPETING_THREAD_END =
;`;
        static if(is(typeof({ mixin(enumMixinStr_NO_COMPETING_THREAD_END); }))) {
            mixin(enumMixinStr_NO_COMPETING_THREAD_END);
        }
    }




    static if(!is(typeof(NO_COMPETING_THREAD_BEGIN))) {
        private enum enumMixinStr_NO_COMPETING_THREAD_BEGIN = `enum NO_COMPETING_THREAD_BEGIN =
;`;
        static if(is(typeof({ mixin(enumMixinStr_NO_COMPETING_THREAD_BEGIN); }))) {
            mixin(enumMixinStr_NO_COMPETING_THREAD_BEGIN);
        }
    }




    static if(!is(typeof(BENIGN_RACE_END))) {
        private enum enumMixinStr_BENIGN_RACE_END = `enum BENIGN_RACE_END =
;`;
        static if(is(typeof({ mixin(enumMixinStr_BENIGN_RACE_END); }))) {
            mixin(enumMixinStr_BENIGN_RACE_END);
        }
    }




    static if(!is(typeof(BENIGN_RACE_BEGIN))) {
        private enum enumMixinStr_BENIGN_RACE_BEGIN = `enum BENIGN_RACE_BEGIN =
;`;
        static if(is(typeof({ mixin(enumMixinStr_BENIGN_RACE_BEGIN); }))) {
            mixin(enumMixinStr_BENIGN_RACE_BEGIN);
        }
    }
    static if(!is(typeof(_No_competing_thread_end_))) {
        private enum enumMixinStr__No_competing_thread_end_ = `enum _No_competing_thread_end_ =
;`;
        static if(is(typeof({ mixin(enumMixinStr__No_competing_thread_end_); }))) {
            mixin(enumMixinStr__No_competing_thread_end_);
        }
    }




    static if(!is(typeof(_No_competing_thread_begin_))) {
        private enum enumMixinStr__No_competing_thread_begin_ = `enum _No_competing_thread_begin_ =
;`;
        static if(is(typeof({ mixin(enumMixinStr__No_competing_thread_begin_); }))) {
            mixin(enumMixinStr__No_competing_thread_begin_);
        }
    }




    static if(!is(typeof(_Benign_race_end_))) {
        private enum enumMixinStr__Benign_race_end_ = `enum _Benign_race_end_ =
;`;
        static if(is(typeof({ mixin(enumMixinStr__Benign_race_end_); }))) {
            mixin(enumMixinStr__Benign_race_end_);
        }
    }




    static if(!is(typeof(_Benign_race_begin_))) {
        private enum enumMixinStr__Benign_race_begin_ = `enum _Benign_race_begin_ =
;`;
        static if(is(typeof({ mixin(enumMixinStr__Benign_race_begin_); }))) {
            mixin(enumMixinStr__Benign_race_begin_);
        }
    }
}
