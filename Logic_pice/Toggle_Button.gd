extends OutputTerminal

class_name ToggleButton

'
func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
		if( (position - event.position).length() <= 15):
			set_state(!get_state())
'
