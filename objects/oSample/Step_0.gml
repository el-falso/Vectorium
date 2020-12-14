/// @description Movement

var moveX = (keyboard_check(ord("D"))-keyboard_check(ord("A")));
var moveY = (keyboard_check(ord("S"))-keyboard_check(ord("W")));
pos.add(move.set(moveX, moveY).normalize().scalar_mul(spd));

if (new Vec2Eq(move.x != vecZero.x, move.y != vecZero.y).any()) {
	show_debug_message("Move: " + move.to_string());
	show_debug_message("Pos: " + pos.to_string());
	show_debug_message("Distance: " + string(pos.distance(oSample1.pos)));
}

x=pos.x;
y=pos.y;