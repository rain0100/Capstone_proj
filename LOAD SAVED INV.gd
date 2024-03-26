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
	for i in range(1, 12): 
		var slot = inventory_node.get_node("Slot"+str(i))
		if i == 1: 
			slot = inventory_node.get_node("Slot")
		if slot:
			var savedItems = str(slot.savedItem)
			file.store_string(savedItems + "\n")
	file.close()

func _load_inventory_pressed():
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
		var path
		if gate == "toggle":
			path =  "res://Logic_pice/Toggle_Button.tscn"
		elif gate == "input":
			path =  "res://Logic_pice/input_terminal.tscn"
		elif gate == "output":
			path =  "res://Logic_pice/output_terminal.tscn"
		else:
			path = "res://Logic_pice/" + gate + "_gate.tscn"
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




