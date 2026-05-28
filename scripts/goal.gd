extends Node2D
@onready var player_node = get_parent().get_parent().get_node("Player")
@onready var flag = get_node("flag")

func _ready() -> void:
	get_node("pole_goal/CollisionShape2D").disabled = false
	get_node("top_goal/CollisionShape2D").disabled = false
	flag.visible = false
	flag.position = Vector2(-94,-90)

func _on_pole_goal_entered(body: Node2D) -> void: #flag end height = where player touched flag?
	if body == player_node:
		var height = body.position.y
		victory(height)

func _on_top_goal_entered(body: Node2D) -> void: #flag end height = top
	if body == player_node:
		victory(-336)

func victory(height):
	flag.visible = true
	get_node("pole_goal/CollisionShape2D").call_deferred("disabled = true")
	get_node("top_goal/CollisionShape2D").call_deferred("disabled = true")
	while flag.position.y < height:
		flag.position.y -= 10
		get_tree().create_timer(.5)
	if flag.position.y > height:
		flag.position.y = height
