extends Node2D

class_name BinaryState
var _state : bool 

func get_state():
	return _state
	
func set_state(s : bool):
	_state = s
	update_color()
	
func update_color():
	if(_state):
		modulate = Color(0, 1, 0, 1)  # green
	else:
		modulate = Color(1, 0, 0, 1)  # red
	

# Called when the node enters the scene tree for the first time.
func _ready():
	update_color()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

	
