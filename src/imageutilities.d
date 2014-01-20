import derelict.sdl2.sdl;
import std.conv;

SDL_Surface* loadBMP(immutable(char)* path, SDL_Surface* screenSurface) {
	SDL_Surface* surface = SDL_LoadBMP(path);
	if(surface == null) {
		throw new Exception("Failed to load surface: " ~ to!string(SDL_GetError()));
	}
	SDL_Surface* optimizedSurface = SDL_ConvertSurface(surface, screenSurface.format, 0);
	if(optimizedSurface == null) {
		throw new Exception("Failed to optimize surface: " ~ to!string(SDL_GetError()));
	}
	SDL_FreeSurface(surface);
	return optimizedSurface;
}

SDL_Surface* scaleSurface(SDL_Surface* surface, int xSize, int zSize) {
	SDL_Surface* newSurface = SDL_CreateRGBSurface(0,xSize,zSize,32,0,0,0,0);
	SDL_BlitScaled(surface, null, newSurface, new SDL_Rect(0, 0, xSize, zSize));
	SDL_FreeSurface(surface);
	return newSurface;
}