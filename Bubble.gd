extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_2d_body_entered(body):
	print("PLAY DEATH ANIMATION, NO NEED TO QUEUE FREE.")
	$BubbleRigid/AnimatedSprite2D.play("Pop")
	Engine.set_time_scale(0.05)
	await get_tree().create_timer(0.15).timeout
	Engine.set_time_scale(1)
	get_tree().reload_current_scene()
	pass
