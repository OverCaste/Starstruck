module entity.ship;

import entity.entity;
import entity.projectile;
import entity.plasmabolt;
import std.conv;
import derelict.sdl2.sdl;
import keyboard;
import entitymanager;

public class Ship : Entity {
	protected {
		int maxX;
		int maxY;
		
		double speed = 3.0;
		SDL_Surface* surface;
	}
	public this(SDL_Surface* screenSurface) {
		super(0, 0, new SDL_Rect(0, 0, 64, 64), screenSurface);
		surface = scaleSurface(loadBMP("images/ship.bmp", screenSurface), boundingBox.w, boundingBox.h);
		maxX = screenSurface.w-boundingBox.w;
		maxY = screenSurface.h-boundingBox.h;
	}
	
	public ~this( ) {
		SDL_FreeSurface(surface);
	}
	
	public override void doPhysics( ) {
		if(isKeyDown(SDLK_DOWN)) {
			setY(y + speed);
		}
		if(isKeyDown(SDLK_UP)) {
			setY(y - speed);
		}
		if(isKeyDown(SDLK_LEFT)) {
			setX(x - speed);
		}
		if(isKeyDown(SDLK_RIGHT)) {
			setX(x + speed);
		}
		if(isKeyDown(SDLK_SPACE)) {
			Projectile bullet = new PlasmaBolt(screenSurface);
			addEntity(bullet, to!int((getX()+getWidth()/2) - bullet.getWidth()/2), to!int(y-2));
		}
	}
	
	public override void setX(double x) {
		if(x < 0) {
			x = 0;
		}
		if(x > maxX) {
			x = maxX;
		}
		
		super.setX(x);
	}
	
	public override void setY(double y) {
		if(y < 0 ){
			y = 0;
		}
		if(y > maxY) {
			y = maxY;
		}
		
		super.setY(y);
	}
	
	public override void render() {
		SDL_BlitSurface(surface, null, screenSurface, boundingBox);
	}
}