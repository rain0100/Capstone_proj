extends Node

class_name GeneralLevel

var save_path="user://story.save"

static var levels: Array[bool] = [false, false, false, false, false, false, false, false, false, false, false, false]
#var level_manager = preload("res://StoryMode/Level_manager.gd")

# Called when the node enters the scene tree for the first time.
func _ready():
	#unlock the next level if the ceret level is beeten
	if(LevelSelect.story_load_flag==0):
		for level_butten in $TextureRect/VBoxContainer.get_children():
			if(level_butten.get_index() == 0 or level_butten.get_index() == 10 or level_butten.get_index() == 11):
				continue
			level_butten.disabled = !levels[level_butten.get_index() - 1]
	else:
		load_data()
		for level_butten in $TextureRect/VBoxContainer.get_children():
			if(levels[level_butten.get_index()-1]==true or level_butten.get_index() == 0 or level_butten.get_index() == 10 or level_butten.get_index() == 11):
				continue
			level_butten.disabled = !levels[level_butten.get_index() - 1]
	# LevelSelect.story_load_flag=0
		
func pass_level(LV_num):
	print("Congrats! Level ", LV_num + 1, " Passed!")
	levels[LV_num] = true
	print(levels)


func save():
	var file=FileAccess.open(save_path, FileAccess.WRITE)
	print(levels)
	file.store_var(levels)
	print("SAVED")

func load_data():
	if FileAccess.file_exists(save_path):
		var file=FileAccess.open(save_path, FileAccess.READ)
		var loaded_levels=file.get_var()
		print(loaded_levels)
		for level_butten in $TextureRect/VBoxContainer.get_children():
			levels[level_butten.get_index()-1]=loaded_levels[level_butten.get_index()-1]
		print("Data Loaded")
	else:
		print("No data")

func _on_save_pressed():
	save()

func _on_modes_pressed():
	if(LevelSelect.story_load_flag == 1):
		get_tree().change_scene_to_file("res://Load Game Menu/Level_Select.tscn")
		# print("back to load game menu")
	else:
		get_tree().change_scene_to_file("res://New Game Menu/Level_Select.tscn")
		# print("back to new game menu")
