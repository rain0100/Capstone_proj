extends PanelContainer

const Slot= preload("res://inventory/slot.tscn")
@onready var item_grid: GridContainer= $MarginContainer/GridContainer
@onready var inventory_interface: PanelContainer= $"."
signal toggle_inventory()

func _ready() -> void:
	var inv_data= preload("res://inventory/Inv.tres")
	populate_item_grid(inv_data.slot_datas)
	toggle_inventory.connect(toggle_inventory_interface)
	
func populate_item_grid(slot_datas: Array[SlotData])->void:
	for child in item_grid.get_children():
		child.queue_free()
		
	for slot_data in slot_datas:
		var slot=Slot.instantiate()
		item_grid.add_child(slot)
		
		if slot_data:
			slot.set_slot_data(slot_data)
			
func _unhandled_input(event:InputEvent)->void:
	if Input.is_action_just_pressed("toggle_inventory"):
		toggle_inventory.emit()

func toggle_inventory_interface() ->void:
	inventory_interface.visible=not inventory_interface.visible
