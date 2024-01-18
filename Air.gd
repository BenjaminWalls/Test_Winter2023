extends Node2D

var Mouse_Position
var Bubble_Position
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	Mouse_Position=get_global_mouse_position()
	global_position=Mouse_Position
	Bubble_Position=get_parent().get_node("Bubble/BubbleRigid").global_position
	look_at(Bubble_Position)

func _ready():
	DisplayServer.mouse_set_mode(DisplayServer.MOUSE_MODE_HIDDEN)
	pass
