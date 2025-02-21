extends Node2D

@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var ray_cast_downright: RayCast2D = $RayCastDownright
@onready var ray_cast_downleft: RayCast2D = $RayCastDownleft
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var dir = 1
func _process(delta: float) -> void:
	if(ray_cast_left.is_colliding()):
		dir = 1
		animated_sprite_2d.flip_h = false
	if(ray_cast_right.is_colliding()):
		dir = -1
		animated_sprite_2d.flip_h = true
	move_local_x(dir * 30 * delta)
