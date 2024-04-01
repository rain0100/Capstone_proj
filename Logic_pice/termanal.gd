extends BinaryState

class_name Terminal 

func _on_mouse_entered():
	UserInput.hovering = self


func _on_mouse_exited():
	UserInput.hovering = null

