extends Area2D

class_name Inventory_Area 

var hovering_over_inventory = false		#flags whether the cursor is hovering over the inventory
@onready var inventorySlots = $"../GridContainer"

# Called when the node enters the scene tree for the first time.
func _ready():
	UserInput.finish_dragging.connect(storeItem)
	
# called when mouse cursor enters the inventory hitbox
func _mouse_enter():
	hovering_over_inventory = true
		
# called when mouse cursor leaves the inventory hitbox
func _mouse_exit():
	hovering_over_inventory = false
	
# called when a user drags an item over the inventory - will store the item
func storeItem(item):
	if hovering_over_inventory:
		for invSlot in inventorySlots.get_children():
			if !invSlot.item:
				if hasNoConnections(item):
					invSlot.slotPut(item)
				break

# this function checks if theres any wire connections to any gates or terminals that are going to be placed in inventory
func hasNoConnections(item):
	if item is Gate:
		# check all item inputs for any wire connections
		for item_inputs in item.inputs:
			if item_inputs.connected_wire != null:
				return false

		# check all item outputs for any wire connections
		for item_outputs in item.outputs:
			if item_outputs.connected_to != null:
				return false

		return true
	elif item is InputTerminal:
		if item.connected_wire != null:
			return false
		else:
			return true
	elif item is OutputTerminal:
		if item.connected_to != null:
			return false
		else:
			return true
	else:
		return false
