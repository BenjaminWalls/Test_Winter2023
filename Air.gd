extends Node2D

var Mouse_Position
var Bubble_Position
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#get_node("RigidBody2D").gravity_scale=0
	Mouse_Position=get_global_mouse_position()
	global_position=Mouse_Position
	Bubble_Position=get_parent().get_node("Bubble/BubbleRigid").global_position
	look_at(Bubble_Position)
	pass
