extends Area2D

signal checkpoint_reached(position)
#@onready var player: CharacterBody2D = $"../../player"
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
var isReached = false

func _ready():
	animated_sprite_2d.play("default") 
	var player = get_tree().get_first_node_in_group("player")
	if player:
		connect("checkpoint_reached", Callable(player, "set_checkpoint"))
		

func _on_body_entered(body: Node2D) -> void: 
		emit_signal("checkpoint_reached", global_position)
		animated_sprite_2d.play("checkpoint_reached")  # Change to the checkpoint_reached animation
		if(isReached == false):
			audio_stream_player_2d.play()
			isReached = true
