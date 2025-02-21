extends Node2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var ray_cast_2d: RayCast2D = $RayCast2D
@onready var timer: Timer = $Timer
@onready var collision_polygon_2d: CollisionPolygon2D = $killzone/CollisionPolygon2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(ray_cast_2d.is_colliding()):
		animated_sprite_2d.play("slash")
		timer.start()
		collision_polygon_2d.disabled = false
		
	#else:
		#animated_sprite_2d.play("idle")
		
		


func _on_timer_timeout() -> void:
	animated_sprite_2d.play("idle")
	collision_polygon_2d.disabled = true
	
