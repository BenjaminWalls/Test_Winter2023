extends ShapeCast2D


var Fan_Position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	Fan_Position=get_parent().global_position - get_parent().get_parent().get_parent().get_parent().get_node("Bubble/BubbleRigid").global_position
	#print(get_collider(0))
	if get_collider(0)==get_parent().get_parent().get_parent().get_parent().get_node("Bubble/BubbleRigid"):
		get_parent().get_parent().get_parent().get_parent().get_node("Bubble/BubbleRigid").apply_central_force(-Fan_Position*0.9)
