extends ShapeCast2D


var Fan_Position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	Fan_Position=get_parent().global_position - get_parent().get_parent().get_parent().get_parent().get_node("Bubble/BubbleRigid").global_position
	if is_colliding():
		if get_collider(0)==get_parent().get_parent().get_parent().get_parent().get_node("Bubble/BubbleRigid"):
			get_parent().get_parent().get_parent().get_parent().get_node("Bubble/BubbleRigid").apply_central_force(-Fan_Position*0.9)


func _on_stop_fan_area_entered(area):
	if area.name=="Bubble_Area":
		queue_free()
		get_parent().get_node("GPUParticles2D").emitting=false
		get_parent().get_node("AnimatedSprite2D").play("static")
