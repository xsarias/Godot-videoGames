extends CanvasLayer
signal restar
@onready var game_over_screen: PanelContainer = $PanelGameOver
@onready var timer: Timer = Timer.new()  # Crear un nuevo Timer
@onready var lives: Control=$"../Camera2D/Control"
func _ready() -> void:
	game_over_screen.visible = false 
	
	timer.wait_time = 2.0  # Esperar 3 segundos
	timer.one_shot = true  # Solo se ejecuta una vez
	timer.connect("timeout", Callable(self, "_on_timer_timeout"))
	add_child(timer)  # Agregar el Timer al CanvasLayer
	lives.connect("game_over", Callable(self, "_on_game_over"))
	

func _on_game_over() -> void:
	print("destruido")
	timer.start()  # Iniciar el temporizador
func _on_timer_timeout() -> void:
	self.visible = true
	game_over_screen.visible = true
	timer.stop()

func _on_button_pressed() -> void:
	get_tree().quit()

func _on_button_2_pressed() -> void:
	emit_signal("restar")
	
