extends Label

class_name Info

@onready var level_node = get_parent().get_parent().get_parent().get_parent().get_parent()

# Called when the node enters the scene tree for the first time.
func _ready():
	text = get_info()
	
func get_info():
	var filename
	match level_node.name:
		"Lv1_wire":
			filename = "res://StoryMode/Level_Info/Info_Text/lv1.txt"
		"LV2_Not":
			filename = "res://StoryMode/Level_Info/Info_Text/lv2.txt"
		"LV3_And":
			filename = "res://StoryMode/Level_Info/Info_Text/lv3.txt"
		"LV4_Or":
			filename = "res://StoryMode/Level_Info/Info_Text/lv4.txt"
		"LV5_Nand_Nor":
			filename = "res://StoryMode/Level_Info/Info_Text/lv5.txt"
		"lv_6_xor":
			filename = "res://StoryMode/Level_Info/Info_Text/lv6.txt"
		"lv_7_Nor with NAnd":
			filename = "res://StoryMode/Level_Info/Info_Text/lv7.txt"
		"lv_8_logic_combo":
			filename = "res://StoryMode/Level_Info/Info_Text/lv8.txt"
		"lv_9_mux":
			filename = "res://StoryMode/Level_Info/Info_Text/lv9.txt"
		"lv_10_register":
			filename = "res://StoryMode/Level_Info/Info_Text/lv10.txt"
		_:
			filename = "res://StoryMode/Level_Info/Info_Text/lv1.txt"
	
	var file = FileAccess.open(filename, FileAccess.READ)
	var content = file.get_as_text()
	return content
