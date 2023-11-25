extends Node2D

class_name Toggle_input

var terminal : Terminal
# Called when the node enters the scene tree for the first time.

func _ready():
	terminal = get_node("Terminal")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
		if( (position - event.position).length() <= 30):
			terminal.set_state(!terminal.get_state())
