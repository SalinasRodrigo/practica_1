extends CharacterBody2D


const SPEED = 150.0
const JUMP_VELOCITY = -300.0
var is_alive = true
@onready var animated_sprite = $AnimatedSprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	#nos movemos hacia la direcciòn elegida
	if direction:
		velocity.x = direction * SPEED
		animated_sprite.flip_h = false if (direction>0) else true
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	update_animation(direction)
	move_and_slide()


func update_animation(direction):
	#corremos una animación dependiendo del estado
	if is_on_floor():
		if direction:
			animated_sprite.play("run")
		else:
			animated_sprite.play("idle")
	else:
		animated_sprite.play("jump")
