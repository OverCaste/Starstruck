module entity.projectile;

import entity.entity;
import derelict.sdl2.sdl;
import keyboard;

public class Projectile : Entity {
	protected {
		double speed = 1.0;
		double acceleration = 0.05;
		SDL_Surface* surface;
	}
	
	public this(SDL_Surface* screenSurface, immutable(char)* path, int width, int height) {
		surface = scaleSurface(loadBMP(path, screenSurface), width, height);
		super(0, 0, new SDL_Rect(0, 0, width, height), screenSurface);
	}
	
	public ~this( ) {
		SDL_FreeSurface(surface);
	}
	
	public override void doPhysics( ) {
		speed += acceleration;
	}
	
	public override void render() {
		SDL_BlitSurface(surface, null, screenSurface, boundingBox);
	}
}