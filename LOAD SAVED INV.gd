extends Button

@onready var inventory = $"../Inventory"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	var gridCont = inventory.get_child(2)
	for slot in gridCont.get_children():
		if (slot.item != null):
			slot.deleteItem()

