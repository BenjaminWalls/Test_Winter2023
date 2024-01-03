extends RayCast2D

var Mouse_Position
var force = 1
var velocity

func _process(delta):
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	Mouse_Position=get_parent().global_position - get_parent().get_parent().get_node("Bubble/BubbleRigid").global_position
	velocity=get_parent().get_parent().get_node("Bubble/BubbleRigid").get_linear_velocity()
	#print("velocity: ", velocity)
	#print("Mouse: ", Mouse_Position)
	#print("Mouse Normalized: ", Mouse_Position.normalized())
	# Adding force when raycast detects bubble and mouse button pressed
	if get_collider()==get_parent().get_parent().get_node("Bubble/BubbleRigid") and Input.is_action_pressed("Blow_air"):
		get_parent().get_parent().get_node("Bubble/BubbleRigid").apply_central_force(-Mouse_Position*2.9)
		get_parent().get_node("GPUParticles2D").emitting=true
	elif(velocity!=Vector2(0,0)): # This is for stopping the bubble to a halt when not pushing air.
		get_parent().get_parent().get_node("Bubble/BubbleRigid").set_linear_velocity(lerp(velocity,Vector2(0,0),0.0005))
		get_parent().get_node("GPUParticles2D").emitting=false
