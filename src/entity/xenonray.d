module entity.xenonray;

import std.math;
import entity.entity;
import entity.projectile;
import derelict.sdl2.sdl;

public class XenonRay : Projectile {
	private {
		double currentRotation = 0;
		double distance = 25.0;
	}
	
	double actualX;
	double actualY;
	
	public this(SDL_Surface* screenSurface) {
		super(screenSurface, "images/plasmabolt.bmp", 20, 20);
		speed = 1;
	}
	
	public override void setX(double x) {
		actualX = x;
	}
	
	public override void setY(double y) {
		actualY = y;
	}
	
	public override void doPhysics( ) {
		currentRotation = ((currentRotation + 0.2) % (PI*2));
		actualY = (actualY-speed);
		
		super.setX(actualX+distance*cos(currentRotation));
		super.setY(actualY+distance*sin(currentRotation));
		
		if(super.getY() < -getHeight() || super.getY() > screenSurface.h || super.getX() < -getWidth() || super.getX() > screenSurface.w) {
			kill();
		}
	}
}