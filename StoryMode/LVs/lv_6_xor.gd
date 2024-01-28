extends GeneralLevel

class_name LevelSix

@onready var level_input1 = $Toggle_Button
@onready var level_input2 = $Toggle_Button2
@onready var xor_gate = $Xor_Gate
@onready var level_output = $Input_terminal

var LV6 : int = 5

#keps track of if the criterea to pass the lv is met
#if both are off
var cri_off: bool = false
#if both inputs are on
var cri_On: bool = false
#if 1 input is on and the other is off
var cri_1_On: bool = false
#same ass above but for the other input
var cri_2_On: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if not (levels[LV6]):
		check_criteria()

func check_criteria():
	#only chek criterea if it has not been met allredy
	#for both wiers off
	if(!cri_off):
		if !level_input1.get_state() and !level_input2.get_state() and level_output.connected_wire != null:
			if xor_gate.inputs[0].connected_wire != null and xor_gate.inputs[0].connected_wire != null:
				if !level_output.get_state():
					print("you got the both off\n")
					cri_off = true
	#for both wiers on
	if(!cri_On):
		if level_input1.get_state() and level_input2.get_state() and level_output.connected_wire != null:
			if xor_gate.inputs[0].connected_wire != null and xor_gate.inputs[0].connected_wire != null:
				if !level_output.get_state():
					print("you got the both on\n")
					cri_On = true

	#for first wier on and other off
	if(!cri_1_On):
		if level_input1.get_state() and !level_input2.get_state() and level_output.connected_wire != null:
			if xor_gate.inputs[0].connected_wire != null and xor_gate.inputs[0].connected_wire != null:
				if level_output.get_state():
					print("you got the first wire on resalt!\n")
					cri_1_On = true

	#for second wier on and other off
	if(!cri_2_On):
		if !level_input1.get_state() and level_input2.get_state() and level_output.connected_wire != null:
			if xor_gate.inputs[0].connected_wire != null and xor_gate.inputs[0].connected_wire != null:
				if level_output.get_state():
					print("you got the second wire on resalt!\n")
					cri_2_On = true


	if(cri_off and cri_On and cri_1_On and cri_2_On):
		pass_level((LV6))
