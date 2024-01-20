extends RayCast2D

var suck = preload("res://Assets/suck.png")
var Mouse_Position
var force = 1
var velocity

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	Mouse_Position=get_parent().global_position - get_parent().get_parent().get_node("Bubble/BubbleRigid").global_position
	velocity=get_parent().get_parent().get_node("Bubble/BubbleRigid").get_linear_velocity()
	
	if GlobalVariables.getBlowOrSuck():
		get_parent().get_node("Sprite2D").set_texture(suck)
	
	# Adding force when raycast detects bubble and mouse button pressed
	if get_collider()==get_parent().get_parent().get_node("Bubble/BubbleRigid") and Input.is_action_pressed("Blow_air") and GlobalVariables.getBlowOrSuck()==false:
		get_parent().get_parent().get_node("Bubble/BubbleRigid").apply_central_force(-Mouse_Position*8)
		get_parent().get_node("GPUParticles2D").emitting=true
		if Input.is_action_just_pressed("Blow_air"):
			$BlowSFX.play()
	elif get_collider()==get_parent().get_parent().get_node("Bubble/BubbleRigid") and Input.is_action_pressed("Suck_air") and GlobalVariables.getBlowOrSuck()==true:
		get_parent().get_parent().get_node("Bubble/BubbleRigid").apply_central_force(Mouse_Position*8)
		get_parent().get_node("GPUParticles2D2").emitting=true
		if Input.is_action_just_pressed("Suck_air"):
			$BlowSFX.play()
	elif(velocity!=Vector2(0,0)): # This is for stopping the bubble to a halt when not pushing air.
		get_parent().get_node("Sprite2D").set_modulate(Color(1,1,1,1))
		get_parent().get_parent().get_node("Bubble/BubbleRigid").set_linear_velocity(lerp(velocity,Vector2(0,0),0.00035))
		get_parent().get_node("GPUParticles2D").emitting=false
		get_parent().get_node("GPUParticles2D2").emitting=false
		$BlowSFX.stop()
