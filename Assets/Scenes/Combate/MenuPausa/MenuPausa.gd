extends CanvasLayer
@onready var audio: AudioStreamPlayer = $ButtonSound

func _ready():
	visible=false
	
func _on_bot_continuar_pressed():
	audio.play()
	get_tree().paused=false 
	visible= get_tree().paused
	
func _on_bot_salir_pressed():
	audio.play()
	get_tree().quit()
