extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _on_new_game_pressed():
	get_tree().change_scene_to_file("res://New Game Menu/Level_Select.tscn")

func _on_quit_pressed():
	get_tree().quit() 


func _on_load_game_pressed():
	get_tree().change_scene_to_file("res://Load Game Menu/Level_Select.tscn")
	print("load presed")	

