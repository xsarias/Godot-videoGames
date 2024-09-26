extends CanvasLayer

@onready var game_over_label: Label = $"GameOverLabel"  # Asegúrate de que la ruta sea correcta
@onready var asteroid_spawner: AsteroidsSpawner = $"AsteroidsSpawner"  # Ajusta la ruta según tu escena

func _ready() -> void:
	pass
	

func _on_nave_destroyed() -> void:
	# Esta función se llama cuando la nave es destruida
	game_over_label.visible = true  # Mostrar el letrero de "Game Over"
