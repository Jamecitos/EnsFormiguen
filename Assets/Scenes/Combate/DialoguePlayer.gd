extends TextureRect


# Called when the node enters the scene tree for the first time.
var repositorioFrasesJugadorInicio=["Definitivamente \n no tienes razón"]
var repositorioFrasesJugadorFinal=[tr("txt_catalan")]

func _ready():
	TranslationServer.set_locale("ca")

func _fraseNuevaJugadorInicio():
	repositorioFrasesJugadorInicio.shuffle()
	$Label.text=repositorioFrasesJugadorInicio[0]

func _fraseNuevaJugadorFinal():
	repositorioFrasesJugadorFinal.shuffle()
	$Label.text=repositorioFrasesJugadorFinal[0]



func _on_spawn_enemies_dialogo_player_inicio():
	visible=true
	_fraseNuevaJugadorInicio()



func _on_spawn_enemies_dialogo_player_final():
	visible=true
	_fraseNuevaJugadorFinal()
