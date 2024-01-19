extends Panel


var time: float = 0.0
var minutes: int = 0
var seconds: int = 0
var msec: int = 0
var vi = SubViewport

func _process(delta) -> void:
	time += delta
	msec = fmod(time,1)*100
	seconds = fmod(time,60)
	minutes = fmod(time,3600)/60
	$Minutes.text = "%02d:" % minutes
	$Seconds.text = "%02d:" % seconds
	$Milliseconds.text = "%03d" % msec

func getTime():
	return time


func _on_broken_sphere_area_area_entered(area):
	if area.name=="Bubble_Area":
		GlobalVariables.retrieveTime(time)
	pass # Replace with function body.
