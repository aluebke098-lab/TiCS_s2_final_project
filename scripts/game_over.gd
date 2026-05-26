extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false

func game_over():
	visible = true
	get_parent().get_node("LevelRoot").visible = false

func _on_restart_pressed() -> void:
	get_tree().call_deferred("reload_current_scene")

func _on_quit_pressed() -> void:
	get_tree().quit()
