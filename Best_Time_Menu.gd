extends Panel

var best_time: float = 0.0
var best_min: int = 0
var best_sec: int = 0
var best_msec: int = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	best_msec = fmod(best_time,1)*100
	best_sec = fmod(best_time,60)
	best_min = fmod(best_time,3600)/60
	
	$Best_Minutes.text = "%02d:" % best_min
	$Best_Seconds.text = "%02d:" % best_sec
	$Best_Msec.text = "%03d" % best_msec
	
	pass

func set_best_time(t):
	best_time=t
