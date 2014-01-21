import std.stdio;
import std.conv;
import derelict.sdl2.sdl;

import entity.ship;
import keyboard;
import entitymanager;

private bool running = true;

private Ship ship;
private SDL_Window* window = null;
private SDL_Surface* screenSurface = null;

public enum SCREEN_WIDTH = 640;
public enum SCREEN_HEIGHT = 480;
public enum SCREEN_ASPECT = to!double(SCREEN_WIDTH)/to!double(SCREEN_HEIGHT);

public ulong gameClock = 0;

void init( ) {
	DerelictSDL2.load("lib/SDL2.dll, SDL2.dll");
	if(SDL_Init(SDL_INIT_EVERYTHING) < 0) {
		throw new Exception("SDL Failed to initialize!");
	}
	//The window we'll be rendering 
	window = SDL_CreateWindow("Starstruck", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, SCREEN_WIDTH, SCREEN_HEIGHT, SDL_WINDOW_SHOWN);
	if(window == null) {
	    throw new Exception("Window could not be created! SDL_Error: " ~ to!string(SDL_GetError()));
	}
	screenSurface = SDL_GetWindowSurface(window);
	ship = new Ship(screenSurface);
	addEntity(ship, screenSurface.w/2-ship.getWidth()/2, screenSurface.h-ship.getHeight());
}

void handleInput( ) {
	SDL_Event event;
	while(SDL_PollEvent(&event) != 0) {
		switch(event.type) {
			case SDL_QUIT: {
				running = false;
				break;
			}
			case SDL_KEYDOWN: {
				handleKeyDown(event.key.keysym.sym);
				break;
			}
			case SDL_KEYUP: {
				handleKeyUp(event.key.keysym.sym);
				break;
			}
			default:
			break;
		}
	}
}

void physics( ) {
	updateEntities( );
}

void render( ) {
	SDL_FillRect(screenSurface, null, SDL_MapRGB(screenSurface.format, 0, 0, 0));
	renderEntities();
	SDL_UpdateWindowSurface(window);
}

void stop( ) {
	SDL_DestroyWindow(window);
	SDL_Quit();
}

void mainLoop( ) {
	while(running) {
		handleInput( );
		physics( );
		render( );
		updateKeyboard( );
		gameClock++;
		SDL_Delay(15);
	}
	stop( );
}


public void main( ) {
	init( );
	mainLoop( );
}