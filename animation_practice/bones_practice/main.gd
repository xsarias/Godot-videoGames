extends Node2D
@onready var skle = $Gbot/Skeleton2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var bone_index = skle.find_bone("neck")
	if bone_index == -1:
		print("Hueso no encontrado.")
		return

	var body_pos = skle.get_bone_pose_position(bone_index)
	print("Posición inicial: ", body_pos)

	var new_body_pos = body_pos + Vector2(10, 7)  # Nueva posición del hueso
	var tween = create_tween()  # Crea el Tween

	# Configura el Tween para mover el hueso
	tween.tween_property(skle, "position", new_body_pos, 1.0)  # Duración de 1 segundo

	# Conectar la señal 'finished' al método
	tween.finished.connect(Callable(self, "_on_tween_finished"))

# Método que se llama cuando el Tween finaliza
func _on_tween_finished():
	print("El Tween ha terminado.")
	var bone_index = skle.find_bone("upper_arm_tweak.R")  # Puedes cambiar a la variable que necesites
	print("Posición final: ", skle.get_bone_pose_position(bone_index))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
