extends Node2D

var moon = preload("res://Assets/space2.png")
var benmoon = preload("res://Assets/benspace.png")

var normalmusic = preload("res://Music & Sound/Music/Bubble Balls - BLOW!!!.mp3")
var benmusic = preload("res://Music & Sound/Music/BenSong.wav")

# Called when the node enters the scene tree for the first time.
func _ready():
	if GlobalVariables.getBenMode():
		get_node("ParallaxBackground/Moon/Sprite2D").set_texture(benmoon)
		$Music.set_stream(benmusic)
		$Music.play()
	else:
		get_node("ParallaxBackground/Moon/Sprite2D").set_texture(moon)
		$Music.set_stream(normalmusic)
		$Music.play()
