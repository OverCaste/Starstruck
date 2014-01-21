module weapon.plasmabolt;

import std.conv;
import weapon.weapon;
import entitymanager;
import entity.plasmabolt;
import entity.ship;

public class PlasmaBolt : Weapon {
	public override void fire(Ship origin) {
		auto bullet = new entity.plasmabolt.PlasmaBolt(origin.getScreenSurface());
		addEntity(bullet, to!int((origin.getX()+origin.getWidth()/2) - bullet.getWidth()/2), to!int(origin.getY()-2));
	}
	
	public override uint getCooldown() {
		return 15;
	}
}
