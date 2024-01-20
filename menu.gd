extends Control


func _on_start_button_pressed():
	SceneTransition.change_scene("res://tutorial.tscn")
	$Start.play()


func _on_quit_button_pressed():
	get_tree().quit()


func _on_start_button_mouse_entered():
	$Select.play()


func _on_quit_button_mouse_entered():
	$Select.play()


func _on_ben_mode_pressed():
	if GlobalVariables.retrieveBen()==false:
		$VBoxContainer/BenMode.text = "Ben Mode: ON"
		GlobalVariables.sendBen(true)
	else:
		$VBoxContainer/BenMode.text = "Ben Mode: OFF"
		GlobalVariables.sendBen(false)


func _on_check_button_pressed():
	if $MenuOptions/CheckButton.is_pressed()==true:
		GlobalVariables.setBlowOrSuck(true)
	if $MenuOptions/CheckButton.is_pressed()==false:
		GlobalVariables.setBlowOrSuck(false)
	#print(GlobalVariables.getBlowOrSuck())
	$Select2.play()
	pass # Replace with function body.
