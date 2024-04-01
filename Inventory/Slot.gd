extends Panel

class_name Slot 

var ItemClass = preload("res://Logic_pice/and_gate.tscn")
var item = null
var savedItem: Array = []

# Called when the node enters the scene tree for the first time.
func _ready():
	# if (get_index() == 0):	#only add item to first inventory box - change depending on whats needed
	# 	item = ItemClass.instantiate()
	# 	item.position = Vector2(37.5,37.5)	#place in middle of inventory box
	# 	add_child(item) 
	pass
	
# place item into a slot
func slotPut(new_item):
	print(new_item)
	item = new_item
	item.position = Vector2(37.5,37.5)
	var parentNode = find_parent("TextureRect")
	parentNode.remove_child(item)
	add_child(item)
	savedItem.append(item)
	
func slotPutLoad(new_item):
	print(new_item)
	item = new_item
	item.position = Vector2(37.5,37.5)
	add_child(item)
	savedItem.append(item)
	
# creates a duplicate of the selected item and puts it in the play area node
func duplicateItem():
	var parentNode = find_parent("TextureRect")
	var copyItem = item.duplicate()
	parentNode.add_child(copyItem)
	
# removes an item from the inventory
func deleteItem():
	remove_child(item)
	savedItem.pop_back()
	item = null
