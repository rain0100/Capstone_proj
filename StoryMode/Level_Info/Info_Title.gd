extends Label

class_name Info_Title

#get the node of the level - this helps dynamically change the info text for each level
@onready var level_node = get_parent().get_parent().get_parent().get_parent().get_parent()

# Called when the node enters the scene tree for the first time.
func _ready():
	text = get_title()
	
func get_title():
	match level_node.name:
		"Lv1_wire":
			return "Wires" 
		"LV2_Not":
			return "NOT Gates"
		"LV3_And":
			return "AND Gates"
		"LV4_Or":
			return "OR Gates"
		"LV5_Nand_Nor":
			return "NAND and NOR Gates"
		"lv_6_xor":
			return "XOR Gates"
		"lv_7_Nor with NAnd":
			return "Circuits with NAND Gates"
		"lv_8_logic_combo":
			return "Boolean Expressions"
		"lv_9_mux":
			return "Multiplexers (MUXes)"
		"lv_10_register":
			return "Registers"
		_:
			return "TITLE"
