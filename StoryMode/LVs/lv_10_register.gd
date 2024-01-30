extends GeneralLevel

class_name LevelTen

@onready var level_output = $Input_terminal
@onready var level_output2 = $Input_terminal2
@onready var not_gate = $Not_Gate
@onready var nand_gate = $Nand_Gate
@onready var nand_gate2 = $Nand_Gate2
@onready var nand_gate3 = $Nand_Gate3
@onready var nand_gate4 = $Nand_Gate4
@onready var level_input = $Toggle_Button
@onready var clock = $clock

var LV10 : int = 9

var cri_on : bool = false
var cri_off : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not (levels[LV10]):
		check_criteria()
		
func check_criteria():
	# check if all gates are connected in the circuit
	if level_output.connected_wire != null and level_output2.connected_wire != null and not_gate.inputs[0].connected_wire != null and nand_gate.inputs[0].connected_wire != null and nand_gate.inputs[1].connected_wire != null and nand_gate2.inputs[0].connected_wire != null and nand_gate2.inputs[1].connected_wire != null and nand_gate3.inputs[0].connected_wire != null and nand_gate3.inputs[1].connected_wire != null and nand_gate4.inputs[0].connected_wire != null and nand_gate4.inputs[1].connected_wire != null:
		if (!cri_on):
			if level_input.get_state() and clock.get_state() and level_output.get_state() and !level_output2.get_state():
				print("Input and output true")
				cri_on = true
		if (!cri_off):
			if !level_input.get_state() and clock.get_state() and !level_output.get_state() and level_output2.get_state():
				print("Input and output false")
				cri_off = true
				
	if cri_on and cri_off:
		pass_level(LV10)
