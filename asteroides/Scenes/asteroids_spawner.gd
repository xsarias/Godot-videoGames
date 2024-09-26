extends Node

class_name AsteroidsSpawner
@export var asteroid_scne: PackedScene
@export var count=6
const Utils= preload("res://Scenes/Utils/utils.gd")
func _ready():
	for i in range(count):
		var random_spawn_position= get_random_position_from_screen_rect()
		spawn_asteroid(Utils.AsteroidSize.BIG, random_spawn_position)
		
func get_random_position_from_screen_rect()->Vector2:
	var rect=get_viewport().get_visible_rect()
	var camera=get_viewport().get_camera_2d()
	var zoom=camera.zoom
	var camera_position=camera.position
	var size=rect.size / zoom
	
	var bounds={}
	bounds.top=(camera_position.y -size.y) / 2
	bounds.bottom=(camera_position.y + size.y) / 2
	bounds.right=(camera_position.x+ size.x)/2
	bounds.left=(camera_position.y-size.x) / 2
	var x=randi_range(bounds.left, bounds.right)
	var y= randi_range(bounds.top, bounds.bottom)
	
	return Vector2(x,y)

func spawn_asteroid(size: Utils.AsteroidSize, position: Vector2):
	var asteroid= asteroid_scne.instantiate() as Asteroid
	get_tree().root.add_child.call_deferred(asteroid)
	asteroid.global_position=position
	asteroid.size= size
