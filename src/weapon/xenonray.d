module weapon.xenonray;

import std.conv;
import entitymanager;
import entity.ship;
import weapon.weapon;

public class XenonRay : Weapon {
	public override void fire(Ship origin) {
		auto bullet = new entity.xenonray.XenonRay(origin.getScreenSurface());
		addEntity(bullet, to!int((origin.getX()+origin.getWidth()/2) - bullet.getWidth()/2), to!int(origin.getY()-2));
	}
	
	public override uint getCooldown() {
		return 25;
	}
}
