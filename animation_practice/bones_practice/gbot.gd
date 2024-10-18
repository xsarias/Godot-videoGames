extends CharacterBody2D

@export var bone_name: String = "chest"  # Cambia esto por el nombre real del hueso

const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func _ready() -> void:
	var skeleton = $Skeleton2D # Referencia al Skeleton2D
	# Obtener el índice del hueso usando get_bone_index
	# Imprimir todos los nombres de los huesos
	for i in range(skeleton.bone_count):
		print(skeleton.get_bone_name(i))
	var bone_index = skeleton.get_bone_index(bone_name)
	if bone_index != -1:
		# Crear una transformación inicial para el hueso
		var new_position = Vector2(30, 0)  # Cambia la posición como desees
		var current_pose = skeleton.get_bone_global_pose(bone_index)  # Obtener la pose actual
		# Mover el hueso
		var new_pose = Transform2D(current_pose.rotation, new_position)
		skeleton.set_bone_global_pose_override(bone_index, new_pose, 1.0, true)
	else:
		print("Hueso no encontrado")

func move_forward():
	get_tree().create_tween().tween_property(self, "position:x", (get_viewport().size.x/5)*4, 1)

func move_chest():
	var skl = $Skeleton2D
	var body = skl.find_bone("chest")
	var body_pos = skl.get_bone_pose_position(body)
	# Haz cualquier cambio en la posición y actualiza el hueso
	skl.set_bone_pose_position(body, 30)
