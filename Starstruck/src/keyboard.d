import std.stdio;
import derelict.sdl2.sdl;

private bool[int] keysDown;

public void handleKeyDown(int id) {
	keysDown[id] = true;
}
	
public void handleKeyUp(int id) {
	keysDown[id] = false;
}
	
public bool isKeyDown(int id) {
	if(!(id in keysDown)) {
		return false;
	}
	return keysDown[id];
}