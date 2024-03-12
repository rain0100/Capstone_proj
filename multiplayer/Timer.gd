extends Panel

var time: float = 0.0
var minutes: int = 0
var seconds: int = 0
var msec: int = 0

func _process(delta) -> void:
	time += delta
	msec = fmod(time, 1) * 100
	seconds = fmod(time, 60)
	minutes = fmod(time, 3600) / 60
	$Minutes.text = "%02d:" % minutes
	$Seconds.text = "%02d:" % seconds
	$Milliseconds.text = "%03d" % msec

#func stop() -> void:
func stop():
	set_process(false)

#func get_time_formatted() -> String:
func get_time_formatted():
	return "%02d:%02d.%03d" % [minutes, seconds, msec]
