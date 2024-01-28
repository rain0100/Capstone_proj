extends Resource
class_name SlotData

const MAX_STACK_SIZE: int = 99
@export var item_data: ItemData
@export_range(1,MAX_STACK_SIZE) var quantity: int = 1

func create_single_slot_data()->SlotData:
	var new_slot_data=duplicate()
	new_slot_data.quantity=1
	quantity-=1
	return new_slot_data
