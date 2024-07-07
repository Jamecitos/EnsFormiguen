extends Control

@onready var bu_play: Button= get_node("./BU_PLAY")
@onready var bu_options: Button= get_node("./BU_OPTIONS")
@onready var bu_catalan: Button= get_node("./BU_CATALAN")
@onready var bu_castellano: Button= get_node("./BU_CASTELLANO")
@onready var bu_exit: Button= get_node("./BU_EXIT")
@onready var audio: AudioStreamPlayer = $ButtonSound

func _ready():
	# Reproduce la música del menú. 
	if not ControlMusica.is_playing():
		ControlMusica.play_music()
	
func _on_play_pressed():
	# Cambia la escena actual a 'Combate.tscn'. Se asume que este archivo existe en el directorio 'res://'.
	audio.play()
	get_tree().change_scene_to_file("res://Assets/Scenes/Combate/combat.tscn")
	

func _on_exit_pressed():
	# Sale del juego o cierra la aplicación.
	audio.play()
	get_tree().quit()
	

func _on_options_pressed():	
		# Cambia la escena actual a 'MenuOpciones.tscn'. Se asume que este archivo existe en el directorio 'res://'.
		audio.play()
		get_tree().change_scene_to_file("res://Assets/Scenes/MenuOpciones/MenuOpciones.tscn")

func _on_bu_catalan_pressed():
	audio.play()
	TranslationServer.set_locale("ca")
	bu_play.text= tr("txt_play")
	bu_options.text= tr("txt_options")
	bu_catalan.text= tr("txt_catalan")
	bu_castellano.text= tr("txt_castellano")
	bu_exit.text= tr("txt_exit")

func _on_bu_castellano_pressed():
	audio.play()
	TranslationServer.set_locale("es")
	bu_play.text= tr("txt_play")
	bu_options.text= tr("txt_options")
	bu_catalan.text= tr("txt_catalan")
	bu_castellano.text= tr("txt_castellano")
	bu_exit.text= tr("txt_exit")

