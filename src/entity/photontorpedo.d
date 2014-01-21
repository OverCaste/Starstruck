module entity.photontorpedo;

import entity.entity;
import entity.projectile;
import derelict.sdl2.sdl;
import keyboard;

public class PhotonTorpedo : Projectile {
	double xMovement;
	public this(SDL_Surface* screenSurface, double yMovement, double xMovement) {
		super(screenSurface, "images/plasmabolt.bmp", 20, 20);
		speed = yMovement;
		this.xMovement = xMovement;
	}
	
	public override void doPhysics( ) {
		setY(getY()-speed);
		setX(getX()-xMovement);
		if(getY() < -getHeight() || getY() > screenSurface.h || getX() < -getWidth() || getX() > screenSurface.w) {
			kill();
		}
	}
}