module weapon.photontorpedo;

import std.conv;
import weapon.weapon;
import entitymanager;
import entity.projectile;
import entity.ship;

public class PhotonTorpedo : Weapon {
	public override void fire(Ship origin) {
		Projectile[] bullets = [
			new entity.photontorpedo.PhotonTorpedo(origin.getScreenSurface(), 5.0, 0.0),
			new entity.photontorpedo.PhotonTorpedo(origin.getScreenSurface(), 5.0, -2.0),
			new entity.photontorpedo.PhotonTorpedo(origin.getScreenSurface(), 5.0, 2.0) ];
		foreach(Projectile p; bullets) {
			addEntity(p, to!int((origin.getX()+origin.getWidth()/2) - p.getWidth()/2), to!int(origin.getY()-2));
		}
	}
	
	public override uint getCooldown() {
		return 15;
	}
}
