# ControlMusica.gd
extends Node

# Referencia al nodo AudioStreamPlayer
@onready var musica_menu: AudioStreamPlayer = $MusicaMenu
@onready var musica_tuneles = $MusicaTuneles


func _ready():
	pass # Inicializar si es necesario

func play_music():
		musica_menu.play()

func stop_music():
		musica_menu.stop()

func is_playing() -> bool:
	return musica_menu and musica_menu.playing

func play_music_tunel():
		musica_tuneles.play()

func stop_music_tunel():
		musica_tuneles.stop()

func is_playing_tunel() -> bool:
	return musica_tuneles and musica_tuneles.playing
