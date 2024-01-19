extends GeneralLevel

@onready var level_output = $Input_terminal
@onready var level_output2 = $Input_terminal2


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not (level_complete):
		check_criteria()

func check_criteria():
	if level_output.get_state() and level_output2.get_state():
		pass_level()
