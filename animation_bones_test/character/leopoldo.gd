extends Node3D

@onready var anim_player = $AnimationPlayer
@onready var skl = $Body/Skeleton3D

func _ready():
	
	move_bone_please("ORG-PISTOL.001") 
	#move_bone_with_tween("ORG-PISTOL.001")
		
func move_bone_please(bone_name:String):
	var body = skl.find_bone(bone_name)
	var body_pos = skl.get_bone_pose_position(body)
	print("Posicion inicial: ", body_pos)
	var new_body_pos = body_pos + Vector3(0, 10, 2)  
	skl.set_bone_pose_position(body, new_body_pos)
	print("Posición final: ", skl.get_bone_pose_position(body))
	
func move_bone_with_tween(bone_name: String):
	var tween = create_tween()
	var bone_index = skl.find_bone(bone_name)

	if bone_index == -1:
		print("Hueso no encontrado.")
		return
	if tween == null:
		print("Error: El Tween no se ha creado correctamente.")
		return

	var body_pos = skl.get_bone_pose_position(bone_index)
	print("Posición inicial: ", body_pos)

	var new_body_pos = body_pos + Vector3(80, 40, 7) 
	
	tween.tween_property(skl, "position", new_body_pos, 1.0)  
	tween.finished.connect(Callable(self, "_on_tween_completed()"))
	print("Posición final: ", skl.get_bone_pose_position(bone_index))

func _on_tween_completed(bone_index):
	print("llegue aqui :c")
	#print("Posición final: ", skl.get_bone_pose_position(bone_index))

func move_bone(bone_name: String):
	var bone_index = skl.find_bone(bone_name)

	if bone_index == -1:
		print("No se encontró el hueso.")
		return

	var tween = create_tween()  # Crea un Tween de escena
	if tween == null:
		print("Error al crear Tween")
	# Obtiene la posición y la rotación actual del hueso
	var body_pos = skl.get_bone_pose_position(bone_index)
	var from_rotation = skl.get_bone_pose(bone_index).basis.get_rotation_quaternion()

	# Imprime la posición inicial del hueso
	print("Posición inicial del hueso:", body_pos)

	# Define la nueva posición y rotación
	var new_body_pos = body_pos + Vector3(80, 40, 7)  # Nueva posición del hueso
	var to_rotation = Quaternion(Vector3(0, 1, 0), deg_to_rad(45)) * from_rotation  # Rotación de 45 grados en el eje Y

	# Tween para la nueva posición
	tween.tween_property(skl, "position", new_body_pos, 1.0)  # Duración de 1 segundo

	# Tween para la nueva rotación
	#tween.tween_property(skl, "basis", to_rotation, 1.0)  # Duración de 1 segundo

	# Verifica la nueva posición del hueso (solo para depuración)
	print("Nueva posición del hueso (después del Tween):", skl.get_bone_pose_position(bone_index))
