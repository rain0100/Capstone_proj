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

func slotPick():
	remove_child(item)
	var parentNode = find_parent("Node2D")
	parentNode.add_child(item)
	item = null
	
func slotPut(new_item):
	# print("SLOT PUT FUNCTION CALLED")
	# print(new_item)
	item = new_item
	item.position = Vector2(37.5,37.5)
	var parentNode = find_parent("Node2D")
	parentNode.remove_child(item)
	add_child(item)
#	print("LIST OF CHILDREN for SLOT ", get_index(), ": ", get_children())
	
func duplicateItem():
	var parentNode = find_parent("Node2D")
	var copyItem = item.duplicate()
	parentNode.add_child(copyItem)
	pass
	
func deleteItem():
	remove_child(item)
	item = null

#for draging
func _on_mouse_entered():
	UserInput.hovering = self.item


func _on_mouse_exited():
	UserInput.hovering = null
