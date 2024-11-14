extends Node2D
@onready var restar : CanvasLayer = %GameOverScreen
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	restar.connect("restar", Callable(self, "_on_restar"))

func _on_restar() -> void:
	get_tree().reload_current_scene()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
