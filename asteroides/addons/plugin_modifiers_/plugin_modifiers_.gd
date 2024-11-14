@tool
extends EditorPlugin

var dock_panel : Control

var panel
var live_checkbox : CheckBox
var button : Button
const TOOL_PANEL = preload("res://addons/plugin_modifiers_/modifiers_tool.tscn")
func _enter_tree() -> void:
	#button = Button.new()
	#add_control_to_dock(EditorPlugin.DOCK_SLOT_LEFT_BL, button)
	#var resource_path = load("res://Scripts/GameModifiers.tres")
	panel = TOOL_PANEL.instantiate()
	add_control_to_dock(EditorPlugin.DOCK_SLOT_LEFT_BL, panel)
	
	
func _exit_tree() -> void:
	
	# Clean-up of the plugin goes here.
	remove_control_from_docks(panel)
	panel.queue_free()
	
