extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_node("Camera2D").position_smoothing_enabled = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func camera_quick_move():
	get_node("Camera2D").position_smoothing_enabled = false
