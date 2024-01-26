extends Node

class_name GeneralLevel

var levels: Array[bool] = [false, false, false, false, false, false, false, false, false, false]

# Called when the node enters the scene tree for the first time.
func _ready():
	$LV3_And.disabled = !levels[2]
	pass

func pass_level(LV_num):
	print("Congrats! Level ", LV_num + 1, " Passed!")
	levels[LV_num] = true
	print(levels)



