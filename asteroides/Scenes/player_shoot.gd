extends Node2D
@export var bullet_scene: PackedScene
@onready var shoot_audio_player: AudioStreamPlayer2D=$"../ShootAudioPlayer"

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		shoot_audio_player.play()
		var bullet= bullet_scene.instantiate() as Bullet
		get_tree().root.add_child(bullet)
		var shot_direction = Vector2(0,1).rotated(get_parent().rotation)
		bullet.position=global_position
		bullet.direction=shot_direction
