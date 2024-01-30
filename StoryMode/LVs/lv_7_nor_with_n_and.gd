extends GeneralLevel

class_name LevelSeven

@onready var level_output = $Input_terminal
@onready var nand_gate = $Nand_Gate
@onready var nand_gate2 = $Nand_Gate2
@onready var nand_gate3 = $Nand_Gate3
@onready var nand_gate4 = $Nand_Gate4
@onready var level_input = $Toggle_Button
@onready var level_input2 = $Toggle_Button2

var cri_output_true : bool = false
var cri_input1_true : bool = false
var cri_input2_true : bool = false
var cri_inputs_true : bool = false

var LV7 : int = 6

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not (levels[LV7]):
		check_criteria()

func check_criteria():
	# check if all gates are connected in the circuit
	if level_output.connected_wire != null and nand_gate.inputs[0].connected_wire and nand_gate.inputs[1].connected_wire and nand_gate2.inputs[0].connected_wire and nand_gate2.inputs[1].connected_wire and nand_gate3.inputs[0].connected_wire and nand_gate3.inputs[1].connected_wire and nand_gate4.inputs[0].connected_wire and nand_gate4.inputs[1].connected_wire:
		#only check criteria if it has not been met already
		if (!cri_output_true):
			if level_output.get_state() and !level_input.get_state() and !level_input2.get_state():
				print("Inputs false and output is true")
				cri_output_true = true
				
		if (!cri_input1_true):
			if !level_output.get_state() and level_input.get_state() and !level_input2.get_state():
				print("First input true, 2nd input false and output is false")
				cri_input1_true = true
				
		if (!cri_input2_true):
			if !level_output.get_state() and !level_input.get_state() and level_input2.get_state():
				print("First input false, 2nd input true and output is false")
				cri_input2_true = true
				
		if (!cri_inputs_true):
			if !level_output.get_state() and level_input.get_state() and level_input2.get_state():
				print("Both inputs true and output is false")
				cri_inputs_true = true
	
	if cri_output_true and cri_input1_true and cri_input2_true and cri_inputs_true:
		pass_level(LV7)
