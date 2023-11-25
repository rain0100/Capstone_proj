extends Node2D

var In : bool = true
var In2 : bool = true
var res : bool = false

func _process(delta):
	# Perform the logical AND operation
	res = In && In2

	# Update the visual representation of the output (Image3)
	if res:
		modulate = Color(0, 1, 0, 1)  # green
	else:
		modulate = Color(1, 0, 0, 1)  # red

func set_input1(value):
	In = value

func set_input2(value):
	In = value
