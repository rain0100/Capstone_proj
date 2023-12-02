extends BinaryState
class_name Wire

var input_terminal : Terminal
var output_terminal : Terminal
var line2D : Line2D

func _ready():
	line2D = get_node("Line2D")
	#output_terminal = get_tree().get_root().get_node("Node2D/Toggle_Button")
	#input_terminal = get_tree().get_root().get_node("Node2D/Input_Terminal")

func _process(delta):
	if(input_terminal == null):
		line2D.points[0] = get_global_mouse_position()
	else:
		line2D.points[0] = input_terminal.position
	if (output_terminal == null):
		line2D.points[1] = get_global_mouse_position()
	else:
		line2D.points[1] = output_terminal.position
	if(input_terminal == null or output_terminal == null):
		return
	self.set_state(output_terminal.get_state())
	input_terminal.set_state(output_terminal.get_state())
