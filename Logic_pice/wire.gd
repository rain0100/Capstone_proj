extends BinaryState
class_name Wire

var input_terminal : Terminal
var output_terminal : Terminal

func _ready():
	output_terminal = get_tree().get_root().get_node("Node2D/Toggle_input/Terminal")

func _process(delta):
	self.set_state(output_terminal.get_state())
