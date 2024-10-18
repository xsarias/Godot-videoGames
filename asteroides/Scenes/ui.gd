extends CanvasLayer

@onready var game_over_screen: PanelContainer = $PanelContainer
@onready var timer: Timer = Timer.new()  # Crear un nuevo Timer

func _ready() -> void:
	game_over_screen.visible = false 
	self.visible = false 
	
	timer.wait_time = 2.0  # Esperar 3 segundos
	timer.one_shot = true  # Solo se ejecuta una vez
	timer.connect("timeout", Callable(self, "_on_timer_timeout"))
	add_child(timer)  # Agregar el Timer al CanvasLayer

func _on_nave_destroyed() -> void:
	print("destruido")
	timer.start()  # Iniciar el temporizador

func _on_timer_timeout() -> void:
	self.visible = true
	game_over_screen.visible = true 

func _on_button_pressed() -> void:
	get_tree().quit()

func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Main.tscn")
