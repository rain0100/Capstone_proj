extends Panel

var ItemClass = preload("res://Logic_pice/and_gate.tscn")
var item = null

# Called when the node enters the scene tree for the first time.
func _ready():
	if (get_index() == 0):	#only add item to first inventory box - change depending on whats needed
		item = ItemClass.instantiate()
		item.position = Vector2(60,60)	#place in middle of inventory box
		add_child(item)
		
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func slotPick():
	remove_child(item)
	var inventoryNode = find_parent("Inventory")
	inventoryNode.add_child(item)
	item = null
	
func slotPut(new_item):
	item = new_item
	item.position = Vector2(60,60)
	var inventoryNode = find_parent("Inventory")
	inventoryNode.remove_child(item)
	add_child(item)
	
func deleteItem():
	remove_child(item)
	item = null

#for draging
func _on_mouse_entered():
	UserInput.hovering = self.item


func _on_mouse_exited():
	UserInput.hovering = null
