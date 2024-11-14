extends CharacterBody2D

class_name Nave
@export var max_speed = 400 
@export var velocity_damping_factor = 0.5  
var ship_velocity: Vector2 = Vector2.ZERO 

func _process(delta):
	get_input()
	rotate_towards_mouse()  

func _physics_process(delta):
	var collision = move_and_collide(ship_velocity * delta)
func get_input():
	var input_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("up") - Input.get_action_strength("down")
	)
	ship_velocity = input_direction * max_speed
	
	if input_direction == Vector2.ZERO:
		ship_velocity = ship_velocity.lerp(Vector2.ZERO, velocity_damping_factor * get_process_delta_time())

func rotate_towards_mouse():
	look_at(get_global_mouse_position())
