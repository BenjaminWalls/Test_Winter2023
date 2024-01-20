extends Control

var show_time: float = 0.0
var minutes: int = 0
var seconds: int = 0
var msec: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	show_time=GlobalVariables.sendTime()
	msec = fmod(show_time,1)*100
	seconds = fmod(show_time,60)
	minutes = fmod(show_time,3600)/60
	$SpeedrunTimer/Minutes.text = "%02d:" % minutes
	$SpeedrunTimer/Seconds.text = "%02d:" % seconds
	$SpeedrunTimer/Milliseconds.text = "%03d" % msec


func _on_return_button_pressed():
	SceneTransition.change_scene("res://menu.tscn")
	$Return.play()


func _on_return_button_mouse_entered():
	$Select.play()
