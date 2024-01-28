extends PanelContainer

const Slot= preload("res://inventory/slot.tscn")
@onready var item_grid: GridContainer= $MarginContainer/GridContainer
@onready var inventory_interface: PanelContainer= $"."
signal toggle_inventory()
var grabbed_slot_data: SlotData
signal drop_slot_data(slot_data: SlotData)
@onready var grabbed_slot: PanelContainer= $"../GrabbedSlot"


func _ready() -> void:
	var inventory_data= preload("res://inventory/Inv.tres")
	populate_item_grid(inventory_data)
	toggle_inventory.connect(toggle_inventory_interface)
	inventory_data.inventory_interact.connect(on_inventory_interact)
	inventory_data.inventory_updated.connect(populate_item_grid)
	
func populate_item_grid(inv_data: InventoryData)->void:
	for child in item_grid.get_children():
		child.queue_free()
		
	for slot_data in inv_data.slot_datas:
		var slot=Slot.instantiate()
		item_grid.add_child(slot)
		
		slot.slot_clicked.connect(inv_data.on_slot_clicked)
		
		if slot_data:
			slot.set_slot_data(slot_data)
			
func _unhandled_input(event:InputEvent)->void:
	if Input.is_action_just_pressed("toggle_inventory"):
		toggle_inventory.emit() 

func toggle_inventory_interface() ->void:
		inventory_interface.visible=not inventory_interface.visible
	
func on_inventory_interact(inventory_data: InventoryData, index: int, button_index: int)->void:
	match [grabbed_slot_data, button_index]:
		[null, MOUSE_BUTTON_LEFT]:
			grabbed_slot_data=inventory_data.grab_slot_data(index)
			
		[_, MOUSE_BUTTON_LEFT]:
			grabbed_slot_data=inventory_data.drop_slot_data(grabbed_slot_data, index)
			
		[null, MOUSE_BUTTON_RIGHT]:
			pass	
			
		[_, MOUSE_BUTTON_RIGHT]:
			grabbed_slot_data=inventory_data.drop_single_slot_data(grabbed_slot_data, index)
	
	update_grabbed_slot()
	
func _physics_process(delata:float)->void:
	if grabbed_slot.visible:
		grabbed_slot.global_position=get_global_mouse_position()+Vector2(5,5)
		
func update_grabbed_slot()->void:
	if grabbed_slot_data:
		grabbed_slot.show()
		grabbed_slot.set_slot_data(grabbed_slot_data)
	else:
		grabbed_slot.hide()


func _on_gui_input(event):
	if event is InputEventMouseButton \
			and event.is_pressed() \
			and grabbed_slot_data:
		
		match event.button_index:
			MOUSE_BUTTON_LEFT:
				drop_slot_data.emit(grabbed_slot_data)
	
	update_grabbed_slot()
		


func _on_control_visibility_changed()->void:
	if not visible and grabbed_slot_data:
		drop_slot_data.emit(grabbed_slot_data)
		update_grabbed_slot()
