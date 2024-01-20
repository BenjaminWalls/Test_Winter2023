extends CanvasLayer

func change_scene(target: String) -> void:
	$AnimationPlayer.play("dissolve")
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file(target)
	$AnimationPlayer.play_backwards("dissolve")

func complete_scene(target: String) -> void:
	$Finish.play()
	await get_tree().create_timer(0.01).timeout
	get_tree().change_scene_to_file(target)
	$AnimationPlayer.play_backwards("dissolve")
