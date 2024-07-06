extends AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var play_music: bool = true
func _process(delta):
	if not play_music and playing:
		stop()
	elif play_music and not playing:
		play()
