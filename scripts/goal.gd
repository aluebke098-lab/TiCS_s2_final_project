extends Node2D
@onready var player_node = get_parent().get_parent().get_node("Player")
@onready var flag = get_node("flag")

func _ready() -> void:
	get_node("pole_goal/CollisionShape2D").disabled = false
	flag.visible = false
	get_parent().get_node("Victory").visible = false

func _on_pole_goal_entered(body: Node2D) -> void: 
	if body == player_node:
		flag.visible = true
		get_node("pole_goal/CollisionShape2D").set_deferred("disabled", true)
		get_parent().get_node("Victory").visible = true
		
