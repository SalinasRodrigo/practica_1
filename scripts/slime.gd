extends Node2D

const SPEED = 60
var direcction = 1

@onready var ray_cast_right = $RayCastRight
@onready var ray_cast_left = $RayCastLeft
@onready var animated_sprite_2d = $AnimatedSprite2D

func _ready():
	add_to_group("Enemy")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ray_cast_right.is_colliding():
		direcction = -1
		animated_sprite_2d.flip_h = true
	if ray_cast_left.is_colliding():
		direcction = 1
		animated_sprite_2d.flip_h = false
	position.x += direcction * SPEED*delta
	 
