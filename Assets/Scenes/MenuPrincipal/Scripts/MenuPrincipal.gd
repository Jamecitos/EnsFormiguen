extends Control

func _ready():
	$MusicaMenu.play()


func _on_play_pressed():
	get_tree().change_scene_to_file("res://Combate.tscn")
	



func _on_language_pressed():
	pass # Replace with function body.


func _on_exit_pressed():
	get_tree().quit()
	


func _on_options_pressed():	
	get_tree().change_scene_to_file("res://MenuOpciones.tscn")
