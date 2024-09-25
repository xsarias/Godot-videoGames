extends CharacterBody2D

class_name Nave
@export var max_speed=10
@export var rotation_speed=3.5
@export var velocity_damping_factor= .5
@export var lineal_velocity=200

var input_vector: Vector2

# -1, 0, 1
var rotation_direction:int

func _process(delta):
	input_vector.x=Input.get_action_strength("rotate_left") - Input.get_action_strength("rotate_right")
	input_vector.y=Input.get_action_strength("thrust")
	
	if Input.is_action_pressed("rotate_left"):
		rotation_direction=-1
	elif Input.is_action_pressed("rotate_right"):
		rotation_direction=1
	else:
		rotation_direction=0

func _physics_process(delta):
	rotation+=rotation_direction*rotation_speed*delta
	if(input_vector.y>0):
		accelerate_forward(delta)
	elif input_vector.y==0 && velocity!= Vector2.ZERO:
		slow_down_and_stop(delta)

func accelerate_forward(delta:float):
	velocity+=(input_vector * lineal_velocity *delta).rotatef(rotation)
	velocity.limit_length(max_speed)
