extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if GlobalVariables.getBlowOrSuck()==false:
		set_text("Welcome to Bubble Balls!Press & Hold Left Click to Blow Air!")
	if GlobalVariables.getBlowOrSuck()==true:
		set_text("Welcome to Bubble Balls!Press & Hold Left Click to Suck Air!")
	pass
