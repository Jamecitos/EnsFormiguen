# ControlMusica.gd
extends Node

# Referencia al nodo AudioStreamPlayer
@onready var musica_menu: AudioStreamPlayer = $MusicaMenu

func play_music():
	if musica_menu:
		musica_menu.play()
		print("estamos dentro")

func stop_music():
	if musica_menu:
		musica_menu.stop()

func is_playing() -> bool:
	return musica_menu and musica_menu.playing

