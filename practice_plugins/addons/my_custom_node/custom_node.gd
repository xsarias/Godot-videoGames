@tool
extends EditorPlugin

func _enter_tree() -> void:
	# Initialization of the plugin goes here.
	add_custom_type("MyButton", "Button", preload("res://addons/my_custom_node/my_button.gd"), preload("res://addons/my_custom_node/icon.jpg"))

func clicked():
	print("You clicked me")
	
func _exit_tree() -> void:
	# Clean-up of the plugin goes here.
	remove_custom_type("MyButton")
