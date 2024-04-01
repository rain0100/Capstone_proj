extends Button 
#testtt
@export var Button_path: String

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	if(LevelSelect.story_load_flag == 1):
		get_tree().change_scene_to_file("res://Load Game Menu/Level_Select.tscn")
		# print("back to load game menu")
	else:
		get_tree().change_scene_to_file("res://New Game Menu/Level_Select.tscn")
		# print("back to new game menu")
