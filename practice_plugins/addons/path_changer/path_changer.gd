@tool
extends EditorPlugin
var path_button

func _enter_tree() -> void:
	# Initialization of the plugin goes here.
	#Creando un botón en la barra de herramientas del editor
	path_button = Button.new()
	path_button.text = "Change path"
	path_button.connect("pressed",self,"_on_path_button_pressed")
	add_control_to_container(EditorPlugin.CONTAINER_TOOLBAR, path_button)
	
	path_button.visible = true

func _exit_tree() -> void:
	# Clean-up of the plugin goes here.
	remove_control_from_container(EditorPlugin.CONTAINER_TOOLBAR, path_button)
	path_button.queue_free()

func _on_path_button_pressed():
	var current_scene=get_editor_interface().get_edited_scene_root()
	
	if current_scene==null:
		push_error("No hay ninguna escena abierta")
		return
	
	#abrir un dialogo para pedir la nueva ruta
	var file_dialog = FileDialog.new()
	file_dialog.mode = FileDialog.FILE_MODE_SAVE_FILE
	file_dialog.access = FileDialog.ACCESS_RESOURCES
	file_dialog.set_current_file(current_scene.scene_file_path)
	file_dialog.popup_centered()
	file_dialog.connect("file_selected",_on_file_selected)
	add_child(file_dialog)
	add_child(file_dialog)
	
func _on_file_selected (new_path: String):
	#guardar la escena actual en la nueva ruta
	var current_scene = get_editor_interface().get_edited_scene_root()
	if current_scene: 
		var packed_scene = PackedScene.new()
		packed_scene.pack(current_scene)
		# Crear un PackedScene y empaquetar el nodo raíz de la escena actual
		var save_result = ResourceSaver.save(packed_scene, new_path)
		if save_result == OK:
			print("Escena guardada en la nueva ruta: ", new_path)
		else:
				push_error("Error al guardar la escena en la nueva ruta.")
