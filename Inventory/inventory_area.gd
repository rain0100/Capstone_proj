extends Area2D

class_name Inventory_Area 

var hovering_over_inventory = false		#flags whether the cursor is hovering over the inventory
@onready var inventorySlots = $"../GridContainer"

# Called when the node enters the scene tree for the first time.
func _ready():
	UserInput.finish_dragging.connect(storeItem)

func _process(delta):
	# prevents items in inventory from being dragged
	if hovering_over_inventory:
		UserInput.hovering = null
	
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
				invSlot.slotPut(item)
				break
