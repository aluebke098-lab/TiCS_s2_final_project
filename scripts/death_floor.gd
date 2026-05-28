extends Area2D
@onready var player_node = get_parent().get_parent().get_node("Player")

func _on_body_entered(body: Node2D) -> void:
	if body == player_node:
		body.hit_player()
