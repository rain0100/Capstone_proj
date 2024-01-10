extends Control
const Pickup=preload("res://Logic_pice/and_gate.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_inventory_drop_slot_data(slot_data):
	var pick_up=Pickup.instantiate()
	pick_up.position=Vector2.UP
	add_child(pick_up)
