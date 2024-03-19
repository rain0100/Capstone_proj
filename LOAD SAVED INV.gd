extends Button
var save_path = "C:/Godot/Capstone_proj/saved_files/slot_data.txt" 
@onready var inventory = $"../Inventory"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _save_inventory_pressed(): 
	var inventory_node = get_node("/root/Node2D/Inventory/GridContainer")
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	#var gate = ""
	for i in range(2, 10): 
		var slot = inventory_node.get_node("Slot"+str(i))
		if slot:
			var savedItems = str(slot.savedItem)
			print("saved: ", savedItems)
			file.store_string(savedItems + "\n")
	file.close()

func _on_pressed():
	var gridCont = inventory.get_child(2)
	#clear inventory
	for slot in gridCont.get_children():
		if (slot.item != null):
			slot.deleteItem()

	#extract saved gates 
	var gate_names = []
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		while not file.eof_reached():
			var line = file.get_line().replace("[", "").replace("]", "")
			if line != "":
				var gate_name = line.split("_")[0].to_lower()
				gate_names.append(gate_name)

	#put them in their respective slots
	for gate in gate_names: 
		var path = "res://Logic_pice/" + gate + "_gate.tscn"
		var ItemClass = load(path)   
		var item = ItemClass.instantiate()
		var slot_found = false
		for slot in gridCont.get_children(): 
			if slot.item == null:
				slot.item = item
				slot.slotPut(slot.item)
				slot_found = true
				break
		if not slot_found:
			print("No empty slots for", gate)



	# var file = FileAccess.open(save_path, FileAccess.READ)
	# var slots = gridCont.get_children()
	# var index = 0
	# while not file.eof_reached() and index < len(slots):
	# 	var line = file.get_line().replace("[", "").replace("]", "") #an array of gates
	# 	if line: 
	# 		var slot = slots[index]
	# 		slot.item = item
	# 		#print(slot.item)
	# 		slot.slotPut(slot.item)
	# 		index +=1


