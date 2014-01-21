module weapon.weapon;

import entity.ship;

public abstract class Weapon {
	public abstract void fire(Ship origin);
	
	public abstract uint getCooldown();
}