extends Node2D


var scene = preload("res://Logic_pice/wire.tscn")
var instance : Wire
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func pressed(object : Node2D):
	if(object == null):
		return
	instance = scene.instantiate()
	if(object is OutputTerminal):
		instance.output_terminal = object
		add_child(instance)

func released(object : Node2D):
	#instance is the wire
	if(instance == null):
		return 
	if(object is InputTerminal):
		instance.input_terminal = object
	else:
		instance.queue_free()
