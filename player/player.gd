extends CharacterBody2D

@export var speed=300.0
@export var accel=1500
@export var fric=1200

@onready var axis = Vector2.ZERO

func _enter_tree():
	set_multiplayer_authority(name.to_int())
	
func _physics_process(delta):
	if Input.is_action_pressed("left"):
		position.x-=delta*speed
	if Input.is_action_pressed("right"):
		position.x+=delta*speed
	if Input.is_action_pressed("up"):
		position.y-=delta*speed
	if Input.is_action_pressed("down"):
		position.y+=delta*speed
	if Input.is_action_pressed("exit"):
		$"../"._exit_game(name)
