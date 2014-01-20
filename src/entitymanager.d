import entity.entity;
import std.container;
import std.range;
import std.algorithm;
import derelict.sdl2.sdl;

private auto entities = make!(SList!Entity);
//private auto entities = new SList(Entity);

public void addEntity(Entity e, int x, int y) {
	e.setX(x);
	e.setY(y);
	entities.insert(e);
}

public void updateEntities( ) {
	foreach(Entity e; entities) {
		if(e.isDead()) {
			entities.linearRemove(take(find(entities[], e), 1));
		} else {
			e.doPhysics();
		}
	}
}

public void renderEntities() {
	foreach(Entity e; entities) {
		e.render();
	}
}
