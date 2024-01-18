extends Control

func _process(delta):
	pass
	#print("BEST TIME: ", best_time)

func _on_start_button_pressed():
	SceneTransition.change_scene("res://tutorial.tscn")


func _on_quit_button_pressed():
	get_tree().quit()
