@tool
extends EditorPlugin

var UI = load("res://addons/chimera_plugin/ui.tscn")
var chimera_ui:Control
func _enter_tree() -> void:
	chimera_ui=UI.instantiate()
	
	add_control_to_bottom_panel(chimera_ui, "Chimera")


func _exit_tree() -> void:
	remove_control_from_bottom_panel(chimera_ui)
	chimera_ui.queue_free()
