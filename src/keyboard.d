import std.stdio;
import std.array;
import derelict.sdl2.sdl;

private bool[int] keysDown;
private bool[int] keysPressed;

public void handleKeyDown(int id) {
	keysDown[id] = true;
	keysPressed[id] = true;
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

public bool wasKeyPressed(int id) {
	if(!(id in keysPressed)) {
		return false;
	}
	return keysPressed[id];
}

public void updateKeyboard( ) {
	clear(keysPressed);
}