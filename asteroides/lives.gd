extends Control
@onready var lives_label : Label = $lives_label
@export var game_modifiers : GameModifiers
var lives = 5
@export var nave_scne: PackedScene
signal game_over
# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	game_modifiers.connect("lives_status", Callable(self, "_on_lives_status"))
	print("en reload? ", game_modifiers.show_lives)
	if game_modifiers.show_lives :
		print("soy real")
	else:
		print("soy falsa")
		lives_label.visible = false
		
func _on_lives_status() -> void:
	print("si entiendo la señal")
	if (game_modifiers.show_lives == true):
		print("escuchooo")
		lives_label.visible = true
	elif(game_modifiers.show_lives == false):
		lives_label.visible = false
		print("toy aqui")
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func lose_life():
	if lives > 0 :
		update_lives_display(lives)
		regenerate_nave()
		lives-=1	
	if lives == 0:
			emit_signal("game_over")
		
		
func regenerate_nave() -> void:
	var nave_instance = nave_scne.instantiate()
	nave_instance.position = Vector2(100, 100)  # Coloca la nave en una posición inicial
	get_parent().add_child(nave_instance)  # Añádela a la escena como hijo		

func _on_nave_destroyed() -> void:
	print("destruido") # Iniciar el temporizador
	lose_life()

func update_lives_display(lives):
	lives_label.text = str(lives)

func _on_good_lives() -> void:
	pass # Replace with function body.
