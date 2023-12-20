extends RayCast2D

var Mouse_Position
var Bubble_Position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Mouse_Position=get_global_mouse_position()
	Bubble_Position=get_parent().get_parent().get_node("Bubble")
	if is_colliding():
		#if get_collider("")
		#print("YUES")
		#Bubble_Position.global_translate(Vector2(1,1))
		pass
	
	pass
