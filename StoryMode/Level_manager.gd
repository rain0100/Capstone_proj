extends Node

class_name LevelManager

static var levels: Array[bool] = [false, false, false, false, false, false, false, false, false, false]

func _ready():
	$LV3_And.disabled = !levels[2]
	pass