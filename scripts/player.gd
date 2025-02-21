extends CharacterBody2D


const SPEED = 120.0
const JUMP_VELOCITY = -300.0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var jump_sound: AudioStreamPlayer2D = $"jump sound"
@onready var respawn_sound: AudioStreamPlayer2D = $"respawn sound"

var checkpoint_position: Vector2  # Store the last checkpoint position

func _ready():
	checkpoint_position = global_position  # Set the initial position as the first checkpoint


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jump_sound.play()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if(is_on_floor()):
		if(direction == 0):
			animated_sprite_2d.play("idle")
		else:
			animated_sprite_2d.play("walk")
	else:
		animated_sprite_2d.play("jump")	
		
	if(direction >0):
		animated_sprite_2d.flip_h = false
	elif(direction < 0):
		animated_sprite_2d.flip_h = true
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
# Function to update checkpoint position
func set_checkpoint(new_position: Vector2):
	checkpoint_position = new_position

# Function to respawn at the last checkpoint

func respawn():
	global_position = checkpoint_position
	velocity = Vector2.ZERO  # Reset velocity to avoid unintended motion
	respawn_sound.play()
