extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_return_button_pressed():
	SceneTransition.change_scene("res://menu.tscn")