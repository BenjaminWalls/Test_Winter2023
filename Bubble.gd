extends Node2D

var pieces = 0
var star = preload("res://star.tscn")
var parent
var vel

# Called when the node enters the scene tree for the first time.
func _ready():
	print(pieces)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	vel = get_node("BubbleRigid").linear_velocity
	#print(get_node("BubbleRigid").linear_velocity)
	#if vel.x >1000 or vel.x <-1000 or vel.y > 1000 or vel.y < -1000:
		#$BubbleRigid/AnimatedSprite2D.play("fast")


func _on_bubble_area_area_entered(area):
	if area.name=="Spike_Area" or area.name=="Fireball_Area" or area.name=="Cannonball_Area":
		$BubbleRigid/AnimatedSprite2D.play("Pop")
		Engine.set_time_scale(0.05)
		await get_tree().create_timer(0.14).timeout
		Engine.set_time_scale(1)
		get_tree().reload_current_scene()
	elif area.name=="Sphere_Area":
		get_node("BubbleRigid/AnimatedSprite2D").visible=false
		get_parent().get_node("Sphere/AnimatedSprite2D").visible=false
		Engine.set_time_scale(0.01)
		await get_tree().create_timer(0.05).timeout
		Engine.set_time_scale(1)
		get_tree().change_scene_to_file("res://menu.tscn")
		DisplayServer.mouse_set_mode(DisplayServer.MOUSE_MODE_VISIBLE)
		pass
	elif area.name=="SpherePiece_Area":
		parent=area.get_parent()
		area.queue_free()
		parent.get_node("AnimatedSprite2D").play("collect")
		#parent.set_linear_velocity(Vector2(0,-50))
		#await get_tree().create_timer(0.25).timeout
		parent.set_linear_velocity(Vector2(0,-30))
		parent.get_node("GPUParticles2D").emitting=true
		parent.get_node("AnimatedSprite2D").set_modulate(Color(0,0,0,0))
		await get_tree().create_timer(0.5).timeout
		parent.get_node("GPUParticles2D").emitting=false
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
