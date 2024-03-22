extends Node

class_name GeneralLevel

static var levels: Array[bool] = [false, false, false, false, false, true, false, false, false, false]
#var level_manager = preload("res://StoryMode/Level_manager.gd")
var level_butten

# Called when the node enters the scene tree for the first time.
func _ready():
	#unlock the next level if the ceret level is beeten
	level_butten = get_node("TextureRect/VBoxContainer")
	print(level_butten.get_children())
	for level in level_butten.get_children():
		if(level.get_index() == 0):
			continue
		level.disabled = !levels[level.get_index() - 1]

func pass_level(LV_num):
	print("Congrats! Level ", LV_num + 1, " Passed!")
	levels[LV_num] = true
	print(levels)





