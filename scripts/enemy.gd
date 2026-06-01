extends CharacterBody2D

@onready var player_node = get_parent().get_parent().get_node("Player")
var speed = 150.0
var gravity = 15 
var active = false

@export_range(-1,1) var dir = -1

func _ready() -> void:
	if dir == 0:
		dir = -1
	
	if dir == 1:
		$Sprite2D.flip_h = true
	else:
		$Sprite2D.flip_h = false

func _physics_process(delta: float) -> void: 
	if active:
		if dir == -1 and $left_wall_ray.is_colliding():
			$Sprite2D.flip_h = true
			dir = 1
		if dir == 1 and $right_wall_ray.is_colliding():
			$Sprite2D.flip_h = false
			dir = -1
		
		velocity.x = lerp(velocity.x, dir * speed, 10.0*delta)
		velocity.y += gravity 
		move_and_slide()

func _on_body_collision_body_entered(body: Node2D) -> void:
	if body == player_node:
		body.hit_player()
	elif body == get_parent().get_node("death_floor"):
		queue_free()

func _on_death_collision_body_entered(body: Node2D) -> void:
	if body == player_node:
		queue_free()

func _on_screen_entered() -> void:
	active = true

func _on_screen_exited() -> void:
	active = false
