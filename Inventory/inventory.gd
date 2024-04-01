extends Node2D

class_name Inventory

const slotClass = preload("res://Inventory/Slot.gd")
@onready var inventorySlots = $GridContainer
@onready var inventory_interface = $"."
signal toggle_inventory()

# Called when the node enters the scene tree for the first time.
func _ready():
	for invSlot in inventorySlots.get_children():
		invSlot.gui_input.connect(slot_gui_input.bind(invSlot))
		toggle_inventory.connect(toggle_inventory_interface)
	
func slot_gui_input(event: InputEvent, slot: slotClass):
	if event is InputEventMouseButton:
		# if item in inventory is left clicked, duplicate it
		if event.button_index == MOUSE_BUTTON_LEFT && event.pressed:
			if slot.item:
				slot.duplicateItem()
		
		# if item in inventory is right clicked, delete it
		if event.button_index == MOUSE_BUTTON_RIGHT && event.pressed:
			if slot.item:
				slot.deleteItem()


func _unhandled_input(event:InputEvent)->void:
	if Input.is_action_just_pressed("toggle_inventory"):
		toggle_inventory.emit() 

func toggle_inventory_interface() ->void:
		inventory_interface.visible=not inventory_interface.visible
		if(LevelSelect.creative_load_flag==1):
			load_inventory()

func load_inventory(): 
	var save_path = "C:/Users/ryanj/Documents/Godot/Capstone_proj/saved_files/slot_data.txt" 
	for slot in inventorySlots.get_children():
		if (slot.item != null):
			slot.deleteItem()
	#extract saved gates 
	var gate_names = []
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		while not file.eof_reached():
			var line = file.get_line().replace("[", "").replace("]", "")
			if line != "":
				var gate_name = line.split("_")[0].to_lower()
				gate_names.append(gate_name)
			

	#put them in their respective slots
	for gate in gate_names:
		var path
		if gate == "toggle":
			path =  "res://Logic_pice/Toggle_Button.tscn"
		elif gate == "input":
			path =  "res://Logic_pice/input_terminal.tscn"
		elif gate == "output":
			path =  "res://Logic_pice/output_terminal.tscn"
		else:
			path = "res://Logic_pice/" + gate + "_gate.tscn"
		var ItemClass = load(path)   
		var item = ItemClass.instantiate()
		var slot_found = false
		for slot in inventorySlots.get_children(): 
			if slot.item == null:
				slot.item = item
				slot.slotPut(slot.item)
				slot_found = true
				break
		if not slot_found:
			print("No empty slots for", gate)
