extends Node2D

#responsable to now what we are huvering over
var hovering : Node2D = null

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if(hovering is Terminal or hovering == null):
				if event.is_pressed():
					WireManager.pressed(hovering)
				elif event.is_released():
					WireManager.released(hovering)
		#this is to togal teh input buttons
		if event.button_index == MOUSE_BUTTON_RIGHT:
			if(hovering is ToggleButton and event.is_pressed()):
				hovering.toggle()

