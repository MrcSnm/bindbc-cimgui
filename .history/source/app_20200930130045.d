import std.stdio;
import bindbc.sdl;
import bindbc.opengl;
import cimgui_;
import imgui.imgui_impl_opengl3;

static SDL_Window* gWindow = null;

SDL_Window* createSDL_GL_Window()
{
	SDL_GL_LoadLibrary(null);

	//Set GL Version
	SDL_GL_SetAttribute(SDL_GLattr.SDL_GL_ACCELERATED_VISUAL, 1);
	SDL_GL_SetAttribute(SDL_GLattr.SDL_GL_CONTEXT_MAJOR_VERSION, 3);
	SDL_GL_SetAttribute(SDL_GLattr.SDL_GL_CONTEXT_MINOR_VERSION, 3);
	//Create window type
	SDL_GL_SetAttribute(SDL_GLattr.SDL_GL_DOUBLEBUFFER, 1);
	SDL_GL_SetAttribute(SDL_GLattr.SDL_GL_DEPTH_SIZE, 24);
	SDL_GL_SetAttribute(SDL_GLattr.SDL_GL_STENCIL_SIZE, 8);
	alias f = SDL_WindowFlags;
	SDL_WindowFlags flags = (f.SDL_WINDOW_OPENGL | f.SDL_WINDOW_RESIZABLE | f.SDL_WINDOW_ALLOW_HIGHDPI);

	SDL_Window* window = SDL_CreateWindow("GL Window", SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, 1280, 720, flags);
	SDL_GLContext ctx = SDL_GL_CreateContext(window);
	SDL_GL_MakeCurrent(window, ctx);
	GLSupport ver = loadOpenGL();
	
	writeln(ver);
	SDL_GL_SetSwapInterval(1);
	return window;
}


int main()
{
    loadSDL();
    loadSDLImage();
    loadSDLTTF();
    SDL_Init(SDL_INIT_VIDEO | SDL_INIT_AUDIO);
    if(!loadCImGUI())
        writeln("Could not read cimgui");
    gWindow = createSDL_GL_Window();

    auto ctx = igCreateContext(null);
    igSetCurrentContext(ctx);
    ImGuiIO* io = igGetIO();
    io.DisplaySize.x = 1280;
    io.DisplaySize.y = 720;
    io.DeltaTime = 1f / 60f;

    bool show_demo_window = true;
    bool show_another_window = true;
    ImVec4 clear_color = ImVec4(0.45f, 0.55f, 0.60f, 1.00f);

    bool quit = false;
    ImGui_ImplOpenGL3_Init("#version 150");
    igStyleColorsDark(null);

    while(!quit)
    {

	    // ImVec2 vec2 = igGetWindowSize();//This already crashes

        SDL_Event e;
		while(SDL_PollEvent(&e)) 
		{
			switch(e.type)
			{
				case SDL_QUIT:
					quit = true;
					break;
				default:break;
			}  
		}
        // Start the Dear ImGui frame
        ImGui_ImplOpenGL3_NewFrame();
        igNewFrame();
        // 3. Show another simple window.
        if (show_another_window)
        {
            igBegin("Another Window", &show_another_window, 0);   // Pass a pointer to our bool variable (the window will have a closing button that will clear the bool when clicked)
            igText("Hello from another window!");
            if (igButton("Close Me", ImVec2()))
                show_another_window = false;
            igEnd();
        }

        // Rendering
		glViewport(0, 0, cast(int)io.DisplaySize.x, cast(int)io.DisplaySize.y);
        glClearColor(clear_color.x, clear_color.y, clear_color.z, clear_color.w);
        glClear(GL_COLOR_BUFFER_BIT);

		igEndFrame();
        igRender();
        ImGui_ImplOpenGL3_RenderDrawData(igGetDrawData());

        SDL_GL_SwapWindow(gWindow);
		
		// SDL_UpdateWindowSurface(gWindow);
		// SDL_Delay(16);
    }

    //////////END IMGUI
    // Cleanup
    ImGui_ImplOpenGL3_Shutdown();
    // ImGui_ImplSDL2_Shutdown();
    igDestroyContext(igGetCurrentContext());

    SDL_GL_DeleteContext(SDL_GL_GetCurrentContext());
    SDL_DestroyWindow(gWindow);
    gWindow = null;
    SDL_Quit();
	return 0;
}