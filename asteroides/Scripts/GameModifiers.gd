extends Resource
class_name GameModifiers
signal lives_status
@export var show_lives : bool:
	set = set_show_lives

func set_show_lives(value : bool) -> void :
	show_lives = value
	print("en resource ", show_lives)
	emit_signal("lives_status")
	#lives_status.emit(show_lives)
