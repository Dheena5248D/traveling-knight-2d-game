extends Node2D
@onready var ray_cast_2d: RayCast2D = $RayCast2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $killzone/CollisionShape2D
@onready var timer: Timer = $Timer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(ray_cast_2d.is_colliding()):
		animated_sprite_2d.play("blast")
		collision_shape_2d.disabled = false
		timer.start()

func _on_timer_timeout() -> void:
	queue_free()
