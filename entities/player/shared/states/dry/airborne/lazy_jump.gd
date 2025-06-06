class_name LazyJump
extends Fall
## A jump that doesn't give you any height.
## Used for actions that look like jumps but don't act like them.


func _trans_rules() -> Variant:
	if not movement.dived and movement.can_air_action() and input.buffered_input(&"dive"):
		return &"Dive"

	if movement.can_spin() and input.buffered_input(&"spin"):
		return &"Spin"

	if Input.is_action_just_pressed(&"groundpound") and movement.can_air_action():
		return &"GroundPound"

	if actor.push_rays.is_colliding() and input.buffered_input(&"jump"):
		return [&"Walljump", -movement.facing_direction]

	if movement.can_init_wallslide():
		return &"Wallslide"

	if actor.vel.y > 0:
		return &"Fall"

	return &""
