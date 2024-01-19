extends Node

class_name GeneralLevel

var level_complete = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func pass_level():
	print("Congrats! Level Passed!")
	level_complete = true
