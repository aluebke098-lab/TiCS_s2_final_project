extends CharacterBody2D

@onready var player_node = get_parent().get_node("Player")
var speed = 35.0
var gravity = 15 

@export_range(-1,1) var dir = 1

func _ready() -> void:
	if dir == 0:
		dir = 1
	
	if dir == 1:
		$Sprite2D.flip_h = true
	else:
		$Sprite2D.flip_h = false

func _physics_process(delta: float) -> void: #if I want them to be able to fall off, remove the floor rays
	if dir == 1 and (!$right_floor_ray.is_colliding() or $left_wall_ray.is_colliding()):
		$Sprite2D.flip_h = false
		_wait_dir_change(-1)
	if dir == -1 and (!$left_floor_ray.is_colliding() or $right_wall_ray.is_colliding()):
		$Sprite2D.flip_h = true
		_wait_dir_change(1)
	
	velocity.x = lerp(velocity.x, dir * speed, 10.0*delta)
	velocity.y += gravity #for flying enemies, would remove gravity (and bottom rect collision shape)
	move_and_slide()

func _wait_dir_change(desired_dir):
	dir = 0
	await get_tree().create_timer(.5).timeout
	dir = desired_dir

func _on_area_2d_body_entered(body: Node2D) -> void: #temp, will prob add a secondary collision for defeating enemy? or maybe an attack action for player
	if body == player_node:
		get_tree().call_deferred("reload_current_scene")
