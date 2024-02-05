extends GeneralLevel

class_name LevelFive

@onready var level_input1 = $Toggle_Button
@onready var level_input2 = $Toggle_Button2
@onready var level_input3 = $Toggle_Button3
@onready var nor_gate = $Nor_Gate
@onready var nand_gate = $Nand_Gate
@onready var level_output1 = $Input_terminal
@onready var level_output2 = $Input_terminal2

var LV5 : int = 4

#keps track of if the criterea to pass the lv is met
#if both are off
var cri_off: bool = false
var pass_state1 : bool
var pass_state2 : bool


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if not (levels[LV5]):
		check_criteria()

func check_criteria():
	if(!cri_off):
		if(level_output1.connected_wire != null and level_output2.connected_wire != null):
			if(nor_gate.inputs[0].connected_wire != null and nor_gate.inputs[1].connected_wire != null):
				if(nand_gate.inputs[0].connected_wire != null and nand_gate.inputs[1].connected_wire != null):
					if(not(level_output1.get_state() or level_output2.get_state())):
						#purpose of this if statement is to check if current states are equal to state from previous frame
						if(pass_state1 == level_output1.get_state() and pass_state2 == level_output2.get_state()):
							cri_off = true
							print("you passed the test")
							pass_level((LV5))
	
	pass_state1 = level_output1.get_state()
	pass_state2 = level_output2.get_state()
