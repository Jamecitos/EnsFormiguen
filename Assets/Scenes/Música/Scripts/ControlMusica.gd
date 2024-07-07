# ControlMusica.gd
extends Node

# Referencia al nodo AudioStreamPlayer
@onready var musica_menu: AudioStreamPlayer = $MusicaMenu
@onready var musica_mapa: AudioStreamPlayer = $MusicaMundo
@onready var musica_combate: AudioStreamPlayer = $MusicaCombate
@onready var musica_boss: AudioStreamPlayer = $MusicaBossFinal

func _ready():
	pass # Inicializar si es necesario

func play_music():
	if musica_menu:
		musica_menu.play()

func stop_music():
	if musica_menu:
		musica_menu.stop()

func is_playing() -> bool:
	return musica_menu and musica_menu.playing


func play_music_mapa():
	if musica_mapa:
		musica_mapa.play()

func stop_music_mapa():
	if musica_mapa:
		musica_mapa.stop()

func is_playing_mapa() -> bool:
	return musica_mapa and musica_mapa.playing

func play_music_combate():
	if musica_combate:
		musica_combate.play()

func stop_music_combate():
	if musica_combate:
		musica_combate.stop()

func is_playing_combate() -> bool:
	return musica_combate and musica_combate.playing

func play_music_boss():
	if musica_boss:
		musica_boss.play()

func stop_music_boss():
	if musica_boss:
		musica_boss.stop()

func is_playing_boss() -> bool:
	return musica_boss and musica_boss.playing

