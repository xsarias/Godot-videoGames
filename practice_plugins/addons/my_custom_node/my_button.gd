@tool
extends Button

func _enter_tree() -> void:
	# Initialization of the plugin goes here.
	pressed.connect(clicked)

func clicked():
	print("You clicked me")
	
func _exit_tree() -> void:
	# Clean-up of the plugin goes here.
	pass
