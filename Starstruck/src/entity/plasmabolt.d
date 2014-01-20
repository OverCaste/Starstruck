module entity.plasmabolt;

import entity.entity;
import entity.projectile;
import derelict.sdl2.sdl;
import keyboard;

public class PlasmaBolt : Projectile {
	private {
		double maxSpeed = 15;
	}
	
	public this(SDL_Surface* screenSurface) {
		super(screenSurface, "images/plasmabolt.bmp", 20, 20);
		speed = 3;
		acceleration = 0.15;
	}
	
	public override void doPhysics( ) {
		if(speed < maxSpeed) {
			speed += acceleration;
			if(speed > maxSpeed) {
				speed = maxSpeed;
			}
		}
		setY(getY()-speed);
		if(getY() < -getHeight() || getY() > screenSurface.h || getX() < -getWidth() || getX() > screenSurface.w) {
			kill();
		}
	}
}