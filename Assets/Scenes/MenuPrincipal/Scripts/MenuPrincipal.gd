extends Control

@onready var bu_play: Button= get_node("./BU_PLAY")
@onready var bu_options: Button= get_node("./BU_OPTIONS")
@onready var bu_catalan: Button= get_node("./BU_CATALAN")
@onready var bu_english: Button= get_node("./BU_ENGLISH")
@onready var bu_exit: Button= get_node("./BU_EXIT")

func _ready():
	# Reproduce la música del menú. Asume que hay un nodo de audio llamado 'MusicaMenu'.
	ControlMusica.play_music = true
	
func _on_play_pressed():
	# Cambia la escena actual a 'Combate.tscn'. Se asume que este archivo existe en el directorio 'res://'.
	get_tree().change_scene_to_file("res://Combate.tscn")
	

func _on_exit_pressed():
	# Sale del juego o cierra la aplicación.
	get_tree().quit()
	

func _on_options_pressed():	
		# Cambia la escena actual a 'MenuOpciones.tscn'. Se asume que este archivo existe en el directorio 'res://'.
		get_tree().change_scene_to_file("res://Assets/Scenes/MenuOpciones/MenuOpciones.tscn")

func _on_bu_catalan_pressed():
	TranslationServer.set_locale("ca")
	bu_play.text= tr("txt_play")
	bu_options.text= tr("txt_options")
	bu_catalan.text= tr("txt_catalan")
	bu_english.text= tr("txt_english")
	bu_exit.text= tr("txt_exit")

func _on_bu_english_pressed():
	TranslationServer.set_locale("en")
	bu_play.text= tr("txt_play")
	bu_options.text= tr("txt_options")
	bu_catalan.text= tr("txt_catalan")
	bu_english.text= tr("txt_english")
	bu_exit.text= tr("txt_exit")

