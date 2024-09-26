extends Node2D
@export var bullet_scene: PackedScene

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		var bullet= bullet_scene.instantiate() as Bullet
		
