extends TextureRect


func _get_drag_data(at_position):
	var preview_textur = TextureRect.new()
	preview_textur.texture = texture
	preview_textur.expand_mode = 1
	preview_textur.size = Vector2(30, 30)
	
	var preview = Control.new()
	preview.add_child(preview_textur)
	
	set_drag_preview(preview)
	
	#change thes 2 tines to duplicate the itam being coped 
	# this stops the duplication
	texture = null
	return preview_textur.texture
	
	#change them to just the line below 
	# this will stop the copy from being  deleted
	#return texture
	
	
	
func _can_drop_data(at_position, data):
	return data is Texture2D

func _drop_data(at_position, data):
	texture = data
