extends GeneralLevel

class_name LevelEight

@onready var level_output = $Input_terminal
@onready var or_gate = $Or_Gate
@onready var or_gate2 =$Or_Gate2
@onready var and_gate = $And_Gate
@onready var not_gate = $Not_Gate
@onready var a = $Toggle_Button
@onready var b = $Toggle_Button2
@onready var c = $Toggle_Button3
@onready var d = $Toggle_Button4

var LV8 : int = 7

var cri_all_off : bool = false
var cri_a_on : bool = false
var cri_b_on : bool = false
var cri_ba_on : bool = false
var cri_c_on : bool = false
var cri_ca_on : bool = false
var cri_cb_on : bool = false
var cri_cba_on : bool = false
var cri_d_on : bool = false
var cri_da_on : bool = false
var cri_db_on : bool = false
var cri_dba_on : bool = false
var cri_dc_on : bool = false
var cri_dca_on : bool = false
var cri_dcb_on : bool = false
var cri_all_on : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not (levels[LV8]):
		check_criteria()

func check_criteria():
	# check if all gates are connected in the circuit
	if level_output.connected_wire != null and or_gate.inputs[0].connected_wire != null and or_gate.inputs[1].connected_wire and or_gate2.inputs[0].connected_wire != null and or_gate2.inputs[1].connected_wire and and_gate.inputs[0].connected_wire != null and and_gate.inputs[1].connected_wire and not_gate.inputs[0].connected_wire != null:
		if (!cri_all_off):
			if !a.get_state() and !b.get_state() and !c.get_state() and !d.get_state() and !level_output.get_state():
				print("All inputs off")
				cri_all_off = true
		if (!cri_a_on):
			if a.get_state() and !b.get_state() and !c.get_state() and !d.get_state() and level_output.get_state():
				print("Only A on")
				cri_a_on = true
		if (!cri_b_on):
			if !a.get_state() and b.get_state() and !c.get_state() and !d.get_state() and !level_output.get_state():
				print("Only B on")
				cri_b_on = true
		if (!cri_ba_on):
			if a.get_state() and b.get_state() and !c.get_state() and !d.get_state() and level_output.get_state():
				print("A and B on")
				cri_ba_on = true
		if (!cri_c_on):
			if !a.get_state() and !b.get_state() and c.get_state() and !d.get_state() and !level_output.get_state():
				print("Only C on")
				cri_c_on = true
		if (!cri_ca_on):
			if a.get_state() and !b.get_state() and c.get_state() and !d.get_state() and !level_output.get_state():
				print("A and C on")
				cri_ca_on = true
		if (!cri_cb_on):
			if !a.get_state() and b.get_state() and c.get_state() and !d.get_state() and !level_output.get_state():
				print("B and C on")
				cri_cb_on = true
		if (!cri_cba_on):
			if a.get_state() and b.get_state() and c.get_state() and !d.get_state() and level_output.get_state():
				print("A, B and C on")
				cri_cba_on = true
		if (!cri_d_on):
			if !a.get_state() and !b.get_state() and !c.get_state() and d.get_state() and level_output.get_state():
				print("Only D on")
				cri_d_on = true
		if (!cri_da_on):
			if a.get_state() and !b.get_state() and !c.get_state() and d.get_state() and level_output.get_state():
				print("A and D on")
				cri_da_on = true
		if (!cri_db_on):
			if !a.get_state() and b.get_state() and !c.get_state() and d.get_state() and level_output.get_state():
				print("B and D on")
				cri_db_on = true
		if (!cri_dba_on):
			if a.get_state() and b.get_state() and !c.get_state() and d.get_state() and level_output.get_state():
				print("A, B, and D on")
				cri_dba_on = true
		if (!cri_dc_on):
			if !a.get_state() and !b.get_state() and c.get_state() and d.get_state() and level_output.get_state():
				print("C and D on")
				cri_dc_on = true
		if (!cri_dca_on):
			if a.get_state() and !b.get_state() and c.get_state() and d.get_state() and level_output.get_state():
				print("A, C, and D on")
				cri_dca_on = true
		if (!cri_dcb_on):
			if !a.get_state() and b.get_state() and c.get_state() and d.get_state() and level_output.get_state():
				print("B, C and D on")
				cri_dcb_on = true
		if (!cri_all_on):
			if a.get_state() and b.get_state() and c.get_state() and d.get_state() and level_output.get_state():
				print("All inputs on")
				cri_all_on = true

	if cri_all_off and cri_a_on and cri_b_on and cri_ba_on and cri_c_on and cri_ca_on and cri_cb_on and cri_cba_on and cri_d_on and cri_da_on and cri_db_on and cri_dba_on and cri_dc_on and cri_dca_on and cri_dcb_on and cri_all_on:
		pass_level(LV8)
