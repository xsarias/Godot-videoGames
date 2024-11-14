extends Node

class_name AsteroidsSpawner
#@onready var restar: CanvasLayer = %GameOverScreen
@export var asteroid_scne: PackedScene
@export var count=6
@onready var explosion_audio_player: AudioStreamPlayer2D= $"../ExplosionAudioPlayer"
const Utils= preload("res://Scenes/Utils/utils.gd")
var asteroids = []
func _ready():
	for i in range(count):
		var random_spawn_position= get_random_position_from_screen_rect()
		spawn_asteroid(Utils.AsteroidSize.BIG, random_spawn_position)
		#restar.connect("restar", Callable(self, "_on_restar"))


		
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
	asteroid.on_asteroid_destroyed.connect(asteroid_destroyed)
	asteroid.on_nave_destroyed.connect(get_node("../Camera2D/Control")._on_nave_destroyed)
	asteroids.append(asteroid)
	
func asteroid_destroyed(size:int, position:Vector2):
	explosion_audio_player.play()
	if(size < 2):
		for i in range(2):
			spawn_asteroid(size, position)
