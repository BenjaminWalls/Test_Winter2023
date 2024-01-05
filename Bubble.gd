extends Node2D

var pieces = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	print(pieces)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_bubble_area_area_entered(area):
	if area.name=="Spike_Area" or area.name=="Fireball_Area" or area.name=="Cannonball_Area":
		$BubbleRigid/AnimatedSprite2D.play("Pop")
		Engine.set_time_scale(0.05)
		await get_tree().create_timer(0.14).timeout
		Engine.set_time_scale(1)
		get_tree().reload_current_scene()
	elif area.name=="Sphere_Area":
		get_tree().change_scene_to_file("res://menu.tscn")
		DisplayServer.mouse_set_mode(DisplayServer.MOUSE_MODE_VISIBLE)
		pass
	elif area.name=="SpherePiece_Area":
		area.get_parent().queue_free()
		pieces+=1
		match pieces:
			1:
				get_parent().get_node("BrokenSphere/AnimatedSprite2D").play("One")
			2:
				get_parent().get_node("BrokenSphere/AnimatedSprite2D").play("Two")
			3:
				get_parent().get_node("BrokenSphere/AnimatedSprite2D").play("Three")
			4:
				get_parent().get_node("BrokenSphere/AnimatedSprite2D").play("Four")
			5:
				get_parent().get_node("BrokenSphere/AnimatedSprite2D").play("Full")
		#print(pieces)
	elif area.name=="BrokenSphere_Area" and pieces>=5:
		get_tree().change_scene_to_file("res://menu.tscn")
		DisplayServer.mouse_set_mode(DisplayServer.MOUSE_MODE_VISIBLE)
