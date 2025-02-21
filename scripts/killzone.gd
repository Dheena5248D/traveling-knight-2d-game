#extends Area2D
#
#@onready var timer: Timer = $Timer
#@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
#@onready var player: CharacterBody2D = null
#@onready var game_controller: Node = %"game controller"
#
#func _ready():
	#player = get_tree().get_first_node_in_group("player")
	#if player == null:
		#print("Error: Player not found in the scene!")
#
#func _on_body_entered(body: Node2D) -> void:
	#timer.start()
	#audio_stream_player_2d.play()
	#Engine.time_scale = 1.5
	#body.set_physics_process(false)
#
#func _on_timer_timeout() -> void:
	#Engine.time_scale = 1
	#var canRespawn = game_controller.can_respawn()
	#if game_controller.can_respawn():
		#player.respawn()  # Move the player back to the last checkpoint
		#player.set_physics_process(true)  # Re-enable movement
	#else:
		#get_tree().reload_current_scene()

extends Area2D

@onready var timer: Timer = $Timer
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var player: CharacterBody2D = null
@onready var game_controller: Node = %"game controller"

var is_respawning = false  # Prevent multiple triggers

func _ready():
	player = get_tree().get_first_node_in_group("player")
	game_controller = get_tree().get_first_node_in_group("game_controller")  # Ensure it's assigned

	if player == null:
		print("Error: Player not found in the scene!")

	if game_controller == null:
		print("Error: Game controller not found in the scene!")

func _on_body_entered(body: Node2D) -> void:
	if is_respawning:  # Prevent double execution
		return
	
	is_respawning = true
	timer.start()
	audio_stream_player_2d.play()
	Engine.time_scale = 1.5
	body.set_physics_process(false)

func _on_timer_timeout() -> void:
	Engine.time_scale = 1

	if game_controller and game_controller.can_respawn():
		print("Respawning player. Lives left:", game_controller.life)  # Debugging
		player.respawn()
		player.set_physics_process(true)
	else:
		get_tree().reload_current_scene()  # Restart the level

	is_respawning = false  # Reset flag after respawning or game over
