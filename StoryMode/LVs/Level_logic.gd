extends Node

class_name GeneralLevel

static var levels: Array[bool] = [false, false, false, false, false, true, false, false, false, false]
#var level_manager = preload("res://StoryMode/Level_manager.gd")

# Called when the node enters the scene tree for the first time.
func _ready():
	#unlock the next level if the ceret level is beeten
	for level_butten in get_children():
		if(level_butten.get_index() == 0):
			continue
		level_butten.disabled = !levels[level_butten.get_index() - 1]

func pass_level(LV_num):
	print("Congrats! Level ", LV_num + 1, " Passed!")
	levels[LV_num] = true
	print(levels)

func _on_new_game_pressed():
	pass # Replace with function body.


func back_to_levels():
	get_tree().change_scene_to_file("res://New Game Menu/Level_Select.tscn")
	pass # Replace with function body.
