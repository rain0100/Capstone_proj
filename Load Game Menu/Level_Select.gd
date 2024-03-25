extends Control


static var story_load_flag=0;
static var creative_load_flag=0;
static var mult_load_flag=0;
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_creative_pressed():
	creative_load_flag=1;
	get_tree().change_scene_to_file("res://creative.tscn")
	

func _on_menu_pressed():
	get_tree().change_scene_to_file("res://Main Menu/Main_Menu.tscn")


func _on_story_pressed():
	story_load_flag=1;
	get_tree().change_scene_to_file("res://StoryMode/story_mode.tscn")
	
		
func _on_multiplayer_pressed():
	mult_load_flag=1
	get_tree().change_scene_to_file("res://multiplayer/multiplayer.tscn")
