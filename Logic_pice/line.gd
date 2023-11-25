extends Node2D

var cer_line : Line2D

func _ready():
	# Create a new Line2D node
	cer_line = Line2D.new()
	add_child(cer_line)
	# Set the default appearance of the line
	cer_line.default_color = Color(0, 1, 1)
	cer_line.width = 4

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				cer_line.add_point(get_global_mouse_position())
		if event.button_index == MOUSE_BUTTON_RIGHT:
				# Clear the existing points and draw the wire
				cer_line.clear_points()


