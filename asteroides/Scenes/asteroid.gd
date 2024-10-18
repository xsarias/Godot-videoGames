extends Area2D
class_name Asteroid

signal on_asteroid_destroyed(size: AsteroidSize, position: Vector2)
signal on_nave_destroyed

var image_array = ["res://Assets/Sprites/ateroide1.png", "res://Assets/Sprites/asteroide2.png", "res://Assets/Sprites/asteroide3.png", "res://Assets/Sprites/asteroide4.png"]
const Utils = preload("res://Scenes/Utils/utils.gd")
@export var speed = 100
var direction: Vector2
var size = Utils.AsteroidSize.BIG

@onready var sprite = $Sprite2D
@onready var explosion_particles = $ExplosionParticles

func _ready() -> void:
	
	var scaleValue = 1 / (size + 1.0)
	scale = Vector2(scaleValue, scaleValue)
	var random_index = randi() % image_array.size()
	var random_image = load(image_array[random_index])
	sprite.texture = random_image

	var x = randf_range(-1, 1)
	var y = randf_range(-1, 1)
	direction = Vector2(x, y)

func _process(delta):
	position += direction * speed * delta

func _on_body_entered(body: Node2D) -> void:
	if body is Nave:
		body.queue_free()
		on_destroy()
		emit_signal("on_nave_destroyed") 


func emit_explosion():
	explosion_particles.emitting = true
	explosion_particles.reparent(get_tree().root)

func on_destroy():
	emit_explosion()
	queue_free()
	var new_asteroids_size = size + 1
	on_asteroid_destroyed.emit(new_asteroids_size, global_position)

func _on_area_entered(area: Node2D):
	if area is Bullet:
		area.queue_free()
		on_destroy()
