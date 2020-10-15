
//          Copyright Marcelo S. N. Mancini(Hipreme) 2020.
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          http://www.boost.org/LICENSE_1_0.txt)

module bindbc.cimgui.additional;
import bindbc.cimgui.types : ImDrawCallback;
import bindbc.cimgui.funcs : igMemAlloc, igMemFree;
import core.stdc.string : memcpy;
//This file is non auto generated, it may be better creating one file which will contain every manually added change

enum ImDrawCallback_ResetRenderState = cast(ImDrawCallback)(-1);
enum IM_OFFSETOF(alias member) = member.offsetof;
enum IM_FREE(T)(ref T* ptr){igMemFree(cast(void*)ptr);}
enum IM_ALLOC(size_t size){return igMemAlloc(size);}
int IM_ARRAYSIZE(T)(ref T var)
{
    return cast(int)((var.sizeof)/((*(var).ptr).sizeof)); //Same as var.sizeof/(*var).sizeof
}
void IM_ASSERT()(auto ref bool exp,  string msg = "")
{
    assert(exp, msg);
}
void IM_DELETE(T)(ref T* p){if(p)destroy(p); igMemFree(p);}

@nogc T* IM_NEW(T)()
{
    import core.lifetime : emplace, forward;
    import core.stdc.string:memcpy;
    T* ptr = cast(T*)igMemAlloc(T.sizeof);
    //emplace(ptr);
    //*ptr = T();
    //T t;
    //memcpy(ptr, &t, T.sizeof);
    return cast(T*)ptr;
}

//Using viewport branch right now, don't want to bother master as it is already 900 commits behind viwport
enum CIMGUI_VIEWPORT_BRANCH = true;


//Now the more specifics one that should not be used extensively
/**
* ImVector_reserve dependency
*/
static int _grow_capacity(T)(ref T imvec, int size)
{
    int new_capacity = imvec.Capacity ? (imvec.Capacity + imvec.Capacity / 2) : 8;
    return new_capacity > size ? new_capacity : size;
}

/**
*   ImVector_resize dependency
*/
static void _reserve(T)(ref T imvec, int new_capacity)
{
    if (new_capacity <= imvec.Capacity)
        return; 
    alias vecDataType = typeof(T.Data);

    vecDataType new_data = cast(vecDataType)IM_ALLOC(cast(size_t)new_capacity * T.sizeof);
    if (imvec.Data) 
    { 
        memcpy(new_data, imvec.Data, cast(size_t)imvec.Size * T.sizeof);
        IM_FREE(imvec.Data); 
    }
    imvec.Data = new_data;
    imvec.Capacity = new_capacity;
}

/**
*   Reserved for using on ImVector_
*   Required on Impl_SDL
*/
void ImVector_resize(T)(ref T imvec, int new_size)
{
    if (new_size > imvec.Capacity)
    {
        _reserve!T(imvec, _grow_capacity!T(imvec, new_size));
        imvec.Size = new_size;
    }
}

/**
*   Reserver for using on ImVector_
*   Required on Impl_SDL
*    //As the data is a C array, it should be the *T.Data
*/
void ImVector_push_back(T)(ref T vec, const ref typeof(*T.Data) v)
{ 
    if (vec.Size == vec.Capacity) 
        _reserve!T(vec, _grow_capacity!T(vec, vec.Size + 1));
    memcpy(&vec.Data[vec.Size], &v, v.sizeof);
    vec.Size++; 
}