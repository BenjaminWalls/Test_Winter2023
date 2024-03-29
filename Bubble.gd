extends Node2D

var pieces = 0
var parent
var vel

# Called when the node enters the scene tree for the first time.
func _ready():
	if GlobalVariables.getBenMode():
		get_node("BubbleRigid/AnimatedSprite2D").play("Ben")
	else:
		get_node("BubbleRigid/AnimatedSprite2D").play("default")
	#print(pieces)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#print(best_time_cur)
	vel = get_node("BubbleRigid").linear_velocity
	#print(get_node("BubbleRigid").linear_velocity)
	#if vel.x >1000 or vel.x <-1000 or vel.y > 1000 or vel.y < -1000:
		#$BubbleRigid/AnimatedSprite2D.play("fast")


func _on_bubble_area_area_entered(area):
	if area.name=="Spike_Area" or area.name=="Fireball_Area" or area.name=="Cannonball_Area":
		get_node("BubbleRigid/Bubble_Area").queue_free()
		if GlobalVariables.getBenMode():
			$BubbleRigid/AnimatedSprite2D.play("BenDeath")
			$BenDeath.play()
		else:
			$BubbleRigid/AnimatedSprite2D.play("Pop")
			$Death.play()
		get_parent().get_node("Music").stop()
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
		SceneTransition.change_scene("res://menu.tscn")
		DisplayServer.mouse_set_mode(DisplayServer.MOUSE_MODE_VISIBLE)
		pass
	elif area.name=="SpherePiece_Area":
		$Collect.play()
		parent=area.get_parent()
		area.queue_free()
		parent.get_node("AnimatedSprite2D").play("collect")
		#parent.set_linear_velocity(Vector2(0,-50))
		#await get_tree().create_timer(0.25).timeout
		parent.set_linear_velocity(Vector2(0,-30))
		parent.get_node("GPUParticles2D").emitting=true
		parent.get_node("AnimatedSprite2D").set_modulate(Color(0,0,0,0))
		pieces+=1
		match pieces:
			1:
				get_parent().get_node("BrokenSphere/AnimatedSprite2D").play("One")
				get_parent().get_node("BrokenSphere/GPUParticles2D").emitting=true
				await get_tree().create_timer(0.5).timeout
				get_parent().get_node("BrokenSphere/GPUParticles2D").emitting=false
			2:
				get_parent().get_node("BrokenSphere/AnimatedSprite2D").play("Two")
				get_parent().get_node("BrokenSphere/GPUParticles2D").emitting=true
				await get_tree().create_timer(0.5).timeout
				get_parent().get_node("BrokenSphere/GPUParticles2D").emitting=false
			3:
				get_parent().get_node("BrokenSphere/AnimatedSprite2D").play("Three")
				get_parent().get_node("BrokenSphere/GPUParticles2D").emitting=true
				await get_tree().create_timer(0.5).timeout
				get_parent().get_node("BrokenSphere/GPUParticles2D").emitting=false
			4:
				get_parent().get_node("BrokenSphere/AnimatedSprite2D").play("Four")
				get_parent().get_node("BrokenSphere/GPUParticles2D").emitting=true
				await get_tree().create_timer(0.5).timeout
				get_parent().get_node("BrokenSphere/GPUParticles2D").emitting=false
			5:
				get_parent().get_node("BrokenSphere/AnimatedSprite2D").play("Full")
				get_parent().get_node("BrokenSphere/GPUParticles2D").emitting=true
		#await get_tree().create_timer(0.5).timeout
		parent.get_node("GPUParticles2D").emitting=false
		#print(pieces)
	elif area.name=="BrokenSphere_Area_Tutorial" and pieces>=5:
		$Finish.play()
		if GlobalVariables.getBenMode()==false:
			$BubbleRigid/AnimatedSprite2D.play("fast")
		SceneTransition.change_scene("res://Easy_demo.tscn")
		#DisplayServer.mouse_set_mode(DisplayServer.MOUSE_MODE_VISIBLE)
	elif area.name=="BrokenSphere_Area_Easy" and pieces>=5:
		#$BubbleRigid/AnimatedSprite2D.play("fast")
		GlobalVariables.setBenAndHard(true)
		DisplayServer.mouse_set_mode(DisplayServer.MOUSE_MODE_VISIBLE)
		SceneTransition.complete_scene("res://best_time_credits.tscn")
	elif area.name=="BrokenSphere_Area_Hard" and pieces>=5:
		#$BubbleRigid/AnimatedSprite2D.play("fast")
		DisplayServer.mouse_set_mode(DisplayServer.MOUSE_MODE_VISIBLE)
		SceneTransition.complete_scene("res://best_time_credits_hard.tscn")
	elif area.name=="SpikeArea":
		get_parent().get_node("TutorialTextandAreas/TutorialLabel3").visible=true
		get_parent().get_node("PopUp").play()
	elif area.name=="FireballArea":
		get_parent().get_node("TutorialTextandAreas/TutorialLabel4").visible=true
		get_parent().get_node("PopUp").play()
	elif area.name=="FanArea":
		get_parent().get_node("TutorialTextandAreas/TutorialLabel5").visible=true
		get_parent().get_node("PopUp").play()
	elif area.name=="CannonArea":
		get_parent().get_node("TutorialTextandAreas/TutorialLabel6").visible=true
		get_parent().get_node("PopUp").play()
	elif area.name=="SphereArea":
		get_parent().get_node("TutorialTextandAreas/TutorialLabel7").visible=true
		get_parent().get_node("PopUp").play()


func _on_hint_4_area_entered(area):
	if area.name=="Bubble_Area":
		get_parent().get_node("Hints/Hint4/Sprite2D").set_modulate(Color(0,0,0,0))
		get_parent().get_node("Hints/Hint4/Sprite2D2").set_modulate(Color(0,0,0,0))
		get_parent().get_node("Hints/Hint4/GPUParticles2D").emitting=false


func _on_hint_5_area_entered(area):
	if area.name=="Bubble_Area":
		get_parent().get_node("Hints/Hint5/Sprite2D").set_modulate(Color(0,0,0,0))
		get_parent().get_node("Hints/Hint5/Sprite2D2").set_modulate(Color(0,0,0,0))
		get_parent().get_node("Hints/Hint5/GPUParticles2D").emitting=false


func _on_hint_3_area_entered(area):
	if area.name=="Bubble_Area":
		get_parent().get_node("Hints/Hint3/Sprite2D").set_modulate(Color(0,0,0,0))
		get_parent().get_node("Hints/Hint3/Sprite2D2").set_modulate(Color(0,0,0,0))
		get_parent().get_node("Hints/Hint3/GPUParticles2D").emitting=false


func _on_hint_1_area_entered(area):
	if area.name=="Bubble_Area":
		get_parent().get_node("CannonballAreas/DestroyCannonball").set_global_position(Vector2(-3130,-463))
		get_parent().get_node("Hints/Hint/Sprite2D").set_modulate(Color(0,0,0,0))
		get_parent().get_node("Hints/Hint/Sprite2D2").set_modulate(Color(0,0,0,0))
		get_parent().get_node("Hints/Hint/GPUParticles2D").emitting=false


func _on_hint_2_area_entered(area):
	if area.name=="Bubble_Area":
		get_parent().get_node("Spikes/Spike170").set_global_position(Vector2(749,2116))
		get_parent().get_node("CannonballAreas/DestroyCannonball4").set_global_position(Vector2(488,2963))
		get_parent().get_node("CannonballAreas/DestroyCannonball5").set_global_position(Vector2(-267,2794))
		get_parent().get_node("Hints/Hint2/Sprite2D").set_modulate(Color(0,0,0,0))
		get_parent().get_node("Hints/Hint2/Sprite2D2").set_modulate(Color(0,0,0,0))
		get_parent().get_node("Hints/Hint2/GPUParticles2D").emitting=false
		get_parent().get_node("Arrow").set_global_position(Vector2(809,2064))
