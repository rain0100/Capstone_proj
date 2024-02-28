extends Button

class_name Info_Button

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_pressed():
	var text_box = get_child(0)
	text_box.visible = not text_box.visible
