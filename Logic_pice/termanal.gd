extends BinaryState

class_name Terminal 

var wire_manager : WireManager

func _ready():
	wire_manager = get_tree().get_root().get_node("Node2D/WireManager")

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if( (position - event.position).length() <= 15):
			if event.is_pressed():
				wire_manager.terminal_pressed(self)
			elif event.is_released():
				wire_manager.terminal_released(self)
