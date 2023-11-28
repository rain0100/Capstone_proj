extends Node2D

class_name WireManager
var scene = preload("res://Logic_pice/wire.tscn")
var instance : Wire
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func terminal_pressed(terminal : Terminal):
	instance = scene.instantiate()
	if(terminal is OutputTerminal):
		instance.output_terminal = terminal
		add_child(instance)

func terminal_released(terminal : Terminal):
	if(terminal is InputTerminal):
		instance.input_terminal = terminal
