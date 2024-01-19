extends Panel

class_name Slot 

var ItemClass = preload("res://Logic_pice/and_gate.tscn")
var item = null

# Called when the node enters the scene tree for the first time.
func _ready():
	if (get_index() == 0):	#only add item to first inventory box - change depending on whats needed
		item = ItemClass.instantiate()
		item.position = Vector2(37.5,37.5)	#place in middle of inventory box
		add_child(item) 
	
# place item into a slot
func slotPut(new_item):
	item = new_item
	item.position = Vector2(37.5,37.5)
	var parentNode = find_parent("Node2D")
	parentNode.remove_child(item)
	add_child(item)
	
# creates a duplicate of the selected item and puts it in the play area node
func duplicateItem():
	var parentNode = find_parent("Node2D")
	var copyItem = item.duplicate()
	parentNode.add_child(copyItem)
	
# removes an item from the inventory
func deleteItem():
	remove_child(item)
	item = null
