extends Node2D

class_name Inventory

var save_path="user://creative.save"
const slotClass = preload("res://Inventory/Slot.gd")
@onready var inventorySlots = $GridContainer
@onready var inventory_interface = $"."
signal toggle_inventory()

# Called when the node enters the scene tree for the first time.
func _ready():
	if(LevelSelect.creative_load_flag==1):
		load_data()
		
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
		
		
func save():
	var file=FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(inventorySlots)
	file.store_var(inventory_interface)
	print("SAVED")

func load_data():
	if FileAccess.file_exists(save_path):
		var file=FileAccess.open(save_path, FileAccess.READ)
		inventorySlots=file.get_var().instance_from_id()
		inventory_interface=file.get_var().instance_from_id()
		print("Data Loaded")

	else:
		print("No data")

func _on_save_pressed():
	save()
