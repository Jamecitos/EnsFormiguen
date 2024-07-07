extends AudioStreamPlayer



var play_music: bool = true
func _process(delta):
	if not play_music and playing:
		stop()
	elif play_music and not playing:
		play()
