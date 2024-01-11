extends Area2D

class_name Inventory_Area 

var hovering_over_inventory = false
@onready var inventorySlots = $"../GridContainer"

# Called when the node enters the scene tree for the first time.
func _ready():
	UserInput.finish_dragging.connect(storeItem)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _mouse_enter():
	hovering_over_inventory = true
	if UserInput.dragging:
		print("DRAGGING ITEM OVER INVENTORY")
		
func _mouse_exit():
	hovering_over_inventory = false
	
func storeItem(item):
	
	if hovering_over_inventory:
		print("FINISHED DRAGGING - PLACE ITEM")
		for invSlot in inventorySlots.get_children():
			if !invSlot.item:
				invSlot.slotPut(item)
				break
	else:
		print("FINISHED DRAGGING - TAKE ITEM")
		var inventoryNode = find_parent("Inventory")
		inventoryNode.holdingItem = null
	pass
