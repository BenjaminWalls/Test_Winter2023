extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_cannonball_area_area_entered(area):
	
	if area.name=="DestroyCannonball" or area.name=="DestroyCannonball4" or area.name=="DestroyCannonball3" or area.name=="DestroyCannonball5":
		queue_free()
