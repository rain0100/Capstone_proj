extends GeneralLevel

class_name LevelNine

@onready var level_output = $Input_terminal
@onready var not_gate = $Not_Gate
@onready var and_gate = $And_Gate
@onready var and_gate2 = $And_Gate2
@onready var or_gate = $Or_Gate
@onready var level_input = $Toggle_Button
@onready var level_input2 = $Toggle_Button2
@onready var level_input3 = $Toggle_Button3

var LV9 : int = 8

var cri_all_off : bool = false
var cri_s_off_in1_off_in2_on : bool = false
var cri_s_off_in1_on_in2_off : bool = false
var cri_s_off_in1_on_in2_on : bool = false
var cri_s_on_in1_off_in2_off : bool = false
var cri_s_on_in1_off_in2_on : bool = false
var cri_s_on_in1_on_in2_off : bool = false
var cri_all_on : bool = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not (levels[LV9]):
		check_criteria()

func check_criteria():
	# check if all gates are connected in the circuit
	if level_output.connected_wire != null and not_gate.inputs[0].connected_wire != null and and_gate.inputs[0].connected_wire != null and and_gate.inputs[1].connected_wire and and_gate2.inputs[0].connected_wire != null and and_gate2.inputs[1].connected_wire and or_gate.inputs[0].connected_wire != null and or_gate.inputs[1].connected_wire:
		if (!cri_all_off):
			if !level_input.get_state() and !level_input2.get_state() and !level_input3.get_state() and !level_output.get_state():
				print("Select set to off, output = first input = off, second input off")
				cri_all_off = true
		if (!cri_s_off_in1_off_in2_on):
			if !level_input.get_state() and level_input2.get_state() and !level_input3.get_state() and !level_output.get_state():
				print("Select set to off, output = first input = off, second input on")
				cri_s_off_in1_off_in2_on = true
		if (!cri_s_off_in1_on_in2_off):
			if level_input.get_state() and !level_input2.get_state() and !level_input3.get_state() and level_output.get_state():
				print("Select set to off, output = first input = on, second input off")
				cri_s_off_in1_on_in2_off = true
		if (!cri_s_off_in1_on_in2_on):
			if level_input.get_state() and level_input2.get_state() and !level_input3.get_state() and level_output.get_state():
				print("Select set to off, output = first input = on, second input on")
				cri_s_off_in1_on_in2_on = true
		if (!cri_s_on_in1_off_in2_off):
			if !level_input.get_state() and !level_input2.get_state() and level_input3.get_state() and !level_output.get_state():
				print("Select set to on, output = second input = off, first input off")
				cri_s_on_in1_off_in2_off = true
		if (!cri_s_on_in1_off_in2_on):
			if !level_input.get_state() and level_input2.get_state() and level_input3.get_state() and level_output.get_state():
				print("Select set to on, output = second input = on, first input off")
				cri_s_on_in1_off_in2_on = true
		if (!cri_s_on_in1_on_in2_off):
			if level_input.get_state() and !level_input2.get_state() and level_input3.get_state() and !level_output.get_state():
				print("Select set to on, output = second input = off, first input on")
				cri_s_on_in1_on_in2_off = true
		if (!cri_all_on):
			if level_input.get_state() and level_input2.get_state() and level_input3.get_state() and level_output.get_state():
				print("Select set to on, output = second input = on, first input on")
				cri_all_on = true

	if cri_all_off and cri_s_off_in1_off_in2_on and cri_s_off_in1_on_in2_off and cri_s_off_in1_on_in2_on and cri_s_on_in1_off_in2_off and cri_s_on_in1_off_in2_on and cri_s_on_in1_on_in2_off and cri_all_on:
		pass_level(LV9)
