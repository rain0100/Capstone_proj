extends Node2D

class_name Inventory

const slotClass = preload("res://Inventory/Slot.gd")
@onready var inventorySlots = $GridContainer
@onready var inventory_interface = $"."
var holdingItem = null
var tempItem = null
signal toggle_inventory()

# Called when the node enters the scene tree for the first time.
func _ready():
	for invSlot in inventorySlots.get_children():
		invSlot.gui_input.connect(slot_gui_input.bind(invSlot))
		toggle_inventory.connect(toggle_inventory_interface)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	for invSlot in inventorySlots.get_children():
#		print(invSlot.get_children())
	pass
	
func slot_gui_input(event: InputEvent, slot: slotClass):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT && event.pressed:
			if holdingItem != null:
				if !slot.item:
					slot.slotPut(holdingItem)
					holdingItem = null
				else:
					var tempItem = slot.item
					slot.slotPick()
					tempItem.global_position = event.global_position
					slot.slotPut(holdingItem)
					holdingItem = tempItem
			elif slot.item:
				# print("SLOT PICK FUNCTION")
				tempItem = slot.item.duplicate()
				holdingItem = tempItem
#				holdingItem = slot.item
				slot.slotPick()
				holdingItem.global_position = get_global_mouse_position()
		
		if event.button_index == MOUSE_BUTTON_RIGHT && event.pressed:
			if slot.item:
				slot.deleteItem()

func _input(event):
	if holdingItem:
		holdingItem.global_position = get_global_mouse_position()


func _unhandled_input(event:InputEvent)->void:
	if Input.is_action_just_pressed("toggle_inventory"):
		toggle_inventory.emit() 

func toggle_inventory_interface() ->void:
		inventory_interface.visible=not inventory_interface.visible
