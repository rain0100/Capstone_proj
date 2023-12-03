extends BinaryState

class_name Terminal 

var wire_manager : WireManager

func _ready():
	wire_manager = get_tree().get_root().get_node("Node2D/WireManager")



func _on_mouse_entered():
	UserInput.hovering = self


func _on_mouse_exited():
	UserInput.hovering = null

