@tool
extends Control
signal pressed
@export var game_modifiers : GameModifiers
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_check_box_pressed() -> void:
	print("Show Enemy Health: " + str(game_modifiers.show_lives))


func _on_check_box_toggled(toggled_on: bool) -> void:
	game_modifiers.show_lives = toggled_on
	print("Show Enemy Health: " + str(game_modifiers.show_lives))
