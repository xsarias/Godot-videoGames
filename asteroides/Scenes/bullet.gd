extends Area2D
class_name Bullet
var direction: Vector2
@export var bullet_speed=700

func _process(delta):
	position+=direction * bullet_speed *delta
