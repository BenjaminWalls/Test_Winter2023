extends RayCast2D

var Mouse_Position
var Bubble_Position
var force=1
var velocity

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Mouse_Position=get_parent().global_position - get_parent().get_parent().get_node("Bubble").global_position
	#Bubble_Position=get_parent().get_parent().get_node("Bubble")
	velocity=get_parent().get_parent().get_node("Bubble/BubbleRigid").get_linear_velocity()
	print("velocity: ", velocity)
	print("Mouse: ", Mouse_Position)
	#print("Mouse Normalized: ", Mouse_Position.normalized())
	# Adding force when raycast detects bubble and mouse button pressed
	if get_collider()==get_parent().get_parent().get_node("Bubble/BubbleRigid") and Input.is_action_pressed("Blow_air"):
		get_parent().get_parent().get_node("Bubble/BubbleRigid").add_constant_force(-Mouse_Position)
	elif(velocity!=Vector2(0,0)): # This is for stopping the bubble to a halt when not pushing air.
		get_parent().get_parent().get_node("Bubble/BubbleRigid").set_linear_velocity(lerp(velocity,Vector2(0,0),0.01))

func _integrate_forces(state):
	get_parent().get_parent().get_node("Bubble/BubbleRigid").rotation_degree = 0
