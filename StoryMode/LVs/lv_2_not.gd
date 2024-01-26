extends GeneralLevel

class_name LevelTwo

@onready var level_output = $Input_terminal
@onready var not_gate = $Not_Gate
@onready var level_input = $Toggle_Button
var LV2 : int = 1

#keps track of if the criterea to pass the lv is met
var cri_true: bool = false
var cri_false: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not (levels[LV2]):
		check_criteria()

func check_criteria():
	#only chek criterea if it has not been met allredy
	if(!cri_true):
		if level_output.get_state() and !level_input.get_state() and level_output.connected_wire != null and not_gate.inputs[0].connected_wire != null:
			print("you got the true\n")
			cri_true = true
	if(!cri_false):
		if !level_output.get_state() and level_input.get_state() and level_output.connected_wire != null and not_gate.inputs[0].connected_wire != null:
			print("you got the false\n")
			cri_false = true	
	if(cri_true and cri_false):
		pass_level((LV2))
