extends Button 
#testtt
@export var Button_path: String

func _on_pressed():
	get_tree().change_scene_to_file(Button_path)
	pass # Replace with function body.

func back_to_levels():
	get_tree().change_scene_to_file("res://New Game Menu/Level_Select.tscn")
