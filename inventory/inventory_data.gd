extends Resource
class_name InventoryData

@export var slot_datas: Array[SlotData]

func on_slot_clicked(index: int, button_index: int) ->void:
	push_error("INV")
