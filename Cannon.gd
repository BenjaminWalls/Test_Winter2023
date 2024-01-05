extends Node2D

var ball = preload("res://cannonball.tscn")
@export var speed = 10.0
@export var wait = 3.0

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("StaticBody2D/Timer").start(wait)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	#var instance = ball.instantiate()
	#add_child(instance)
	pass


func _on_timer_timeout():
	var instance = ball.instantiate()
	var velocity = get_node("StaticBody2D/Marker2D").global_position - global_position
	instance.apply_central_impulse(velocity*speed*8)
	instance.set_constant_force(velocity*speed)
	add_child(instance)
 
