extends Control

var bballs = preload("res://Assets/benbubble.png")
var cuteballs = preload("res://Assets/cute_bubble_idle.png")

func _ready():
	# Enables The Challenge and Ben Mode
	if GlobalVariables.getBenAndHard()==true:
		$"MenuOptions/The Challenge".set_disabled(false)
		$MenuOptions/CheckBoxBen.set_disabled(false)
	if GlobalVariables.getBenMode():
		$MenuOptions/CheckBoxBen.set_pressed(true)
	if GlobalVariables.getBlowOrSuck():
		$MenuOptions/CheckButton.set_pressed(true)
	pass

func _process(delta):
	if GlobalVariables.getBenMode():
		$GPUParticles2D.set_texture(bballs)
		$GPUParticles2D2.set_texture(bballs)
		$GPUParticles2D3.set_texture(bballs)
		$Title.set_text("Ben Balls")
	else:
		$GPUParticles2D.set_texture(cuteballs)
		$GPUParticles2D2.set_texture(cuteballs)
		$GPUParticles2D3.set_texture(cuteballs)
		$Title.set_text("Bubble Balls")

#Starts the game.
func _on_start_button_pressed():
	SceneTransition.change_scene("res://tutorial.tscn")
	$Start.play()

#Quits game
func _on_quit_button_pressed():
	get_tree().quit()

#Sound effect
func _on_start_button_mouse_entered():
	$Select.play()

#Sound effect
func _on_quit_button_mouse_entered():
	$Select.play()

#Gameplay choice between blowing or sucking.
func _on_check_button_pressed():
	if $MenuOptions/CheckButton.is_pressed()==true:
		GlobalVariables.setBlowOrSuck(true)
	if $MenuOptions/CheckButton.is_pressed()==false:
		GlobalVariables.setBlowOrSuck(false)
	#print(GlobalVariables.getBlowOrSuck())
	$Select2.play()
	pass # Replace with function body.

#Plays The Challenge
func _on_hard_mode_pressed():
	SceneTransition.change_scene("res://demo_level.tscn")
	$Start.play()

#Enables Ben Mode
func _on_check_box_ben_pressed():
	if GlobalVariables.getBenMode()==false:
		GlobalVariables.setBenMode(true)
	else:
		GlobalVariables.setBenMode(false)
	#print(GlobalVariables.getBenMode())
	$Select2.play()
	#if $MenuOptions/CheckBoxBen.
	pass # Replace with function body.


func _on_check_box_ben_mouse_entered():
	$Select.play()
