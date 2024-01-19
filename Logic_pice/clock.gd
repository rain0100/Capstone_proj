extends OutputTerminal

class_name Clock

var clock_freq : int = 30
var current_time: int = 0

var clock_running : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if clock_running:
		if current_time == clock_freq:
			set_state(!get_state())
			current_time = 0
		
		current_time += 1

func toggleClock():
	clock_running = !clock_running
