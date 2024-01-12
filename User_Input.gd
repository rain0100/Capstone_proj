extends Node2D

#responsable to now what we are huvering over
var hovering : Node2D = null
var dragging : Node2D = null

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.is_pressed():
				if(hovering is Terminal and Input.is_key_pressed(KEY_SHIFT)):
					if(hovering is InputTerminal):
						WireManager.delete(hovering)
					#this is for draging the wire
					WireManager.pressed(hovering)
				#this is for draging the wire
				else:
					begin_drag(hovering)
						
			#this is the start of relesing stuff
			elif event.is_released():
				if dragging:
					end_drag()
					
				elif(hovering is Terminal or hovering == null):
					WireManager.released(hovering)
		#this is to togal teh input buttons
		if event.button_index == MOUSE_BUTTON_RIGHT:
			if(hovering is ToggleButton and event.is_pressed()):
				hovering.toggle()
				
func _process(delta):
	if dragging != null:
		drag()

func begin_drag(target : Node2D):
	dragging = target

func drag():
	dragging.global_position = get_global_mouse_position()

func end_drag():
	dragging = null
