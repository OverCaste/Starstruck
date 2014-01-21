module entity.entity;

public import derelict.sdl2.sdl;
public import imageutilities;
import std.conv;

/**Entities are the base of any render object, they have position, physics, and rendering.*/

public class Entity {
	protected {
		double x;
		double y;
		bool dead = false;
		SDL_Rect* boundingBox;
		SDL_Surface* screenSurface;
	}
	
	public this(double x, double y, SDL_Rect* boundingBox, SDL_Surface* screenSurface) {
		this.x = x;
		this.y = y;
		this.boundingBox = boundingBox;
		this.screenSurface = screenSurface;
	}
	
	public void setX(double x) {
		this.x = x;
		boundingBox.x = to!int(x);
	}
	
	public void setY(double y) {
		this.y = y;
		boundingBox.y = to!int(y);
	}
	
	public double getX( ) {
		return x;
	}
	
	public double getY( ) {
		return y;
	}
	
	public int getWidth( ) {
		return boundingBox.w;
	}
	
	public int getHeight( ) {
		return boundingBox.h;
	}
	
	public void kill( ) {
		dead = true;
	}
	
	public bool isDead( ) {
		return dead;
	}
	
	public SDL_Surface* getScreenSurface( ) {
		return screenSurface;
	}
	
	public void doPhysics( ) {
	}
	
	public void render() {
		
	}
}