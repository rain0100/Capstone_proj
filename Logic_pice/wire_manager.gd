extends Node2D


var scene = preload("res://Logic_pice/wire.tscn")
var wireobj : Wire
var is_drawing : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func pressed(object : Node2D):
	if(object == null or is_drawing):
		return
	if(object is OutputTerminal):
		is_drawing = true
		#rename instance to wireobject
		wireobj = scene.instantiate()
		wireobj.output_terminal = object
		add_child(wireobj)
	#nead to maek one to delet wire 
	#will do this by cliking on inputtermanal

func released(object : Node2D):
	#instance is the wire
	if(wireobj == null or is_drawing == false):
		return 
	is_drawing = false
	if(object is InputTerminal):
		wireobj.input_terminal = object
	else:
		wireobj.queue_free()
