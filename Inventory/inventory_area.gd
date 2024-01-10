extends Area2D

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
	if UserInput.dragging and hovering_over_inventory:
		print("DRAGGING ITEM OVER INVENTORY")
		
func _mouse_exit():
	hovering_over_inventory = false
	
func storeItem(item):
	print("FINISHED DRAGGING")
	if hovering_over_inventory:
		for invSlot in inventorySlots.get_children():
			if !invSlot.item:
				invSlot.slotPut(item)
	pass
