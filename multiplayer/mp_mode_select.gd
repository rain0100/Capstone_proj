extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_menu_pressed():
	get_tree().change_scene_to_file("res://Main Menu/Main_Menu.tscn")	

func _on_resource_challenge_pressed():
	get_tree().change_scene_to_file("res://multiplayer/resource_challenge.tscn")


func _on_time_challenge_pressed():
	get_tree().change_scene_to_file("res://multiplayer/time_challenge.tscn")
