extends Control

func _ready():
	# Reproduce la música del menú. Asume que hay un nodo de audio llamado 'MusicaMenu'.
	$MusicaMenu.play()


func _on_play_pressed():
	# Cambia la escena actual a 'Combate.tscn'. Se asume que este archivo existe en el directorio 'res://'.
	get_tree().change_scene_to_file("res://Combate.tscn")
	



func _on_language_pressed():
	pass # Replace with function body.


func _on_exit_pressed():
	# Sale del juego o cierra la aplicación.
	get_tree().quit()
	


func _on_options_pressed():	
		# Cambia la escena actual a 'MenuOpciones.tscn'. Se asume que este archivo existe en el directorio 'res://'.
		get_tree().change_scene_to_file("res://MenuOpciones.tscn")
