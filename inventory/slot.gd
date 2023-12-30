extends PanelContainer

@onready var texture_rect: TextureRect = $MarginContainer/TextureRect

func set_slot_data(slot_data: SlotData) -> void:
	var item_data= slot_data.item_data
	texture_rect.texture=item_data.texture
	tooltip_text=  "%s\n%s" %[item_data.name, item_data.description]
	
