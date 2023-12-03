extends Node2D

class_name Gate

var inputs : Array = []
var outputs : Array = []

# Called when the node enters the scene tree for the first time.
func _ready():
	var num_inputs = get_node("Inputs").get_child_count()
	var num_outputs = get_node("Outputs").get_child_count()
	for i in range(num_inputs):
		inputs.append(get_node("Inputs/IN" + str(i)))
	for i in range(num_outputs):
		outputs.append(get_node("Outputs/OUT" + str(i)))


func _process(delta):
	evaluate()

func evaluate():
	print("ERROR: evaluate must be implemented in subclasses")

#for draging
func _on_mouse_entered():
	UserInput.hovering = self


func _on_mouse_exited():
	UserInput.hovering = null
