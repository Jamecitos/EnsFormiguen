extends TextureRect


# Called when the node enters the scene tree for the first time.
var repositorioFrasesJugadorInicio=["Definitivamente \nno tienes razón..."]
var repositorioFrasesJugadorFinal=["Ya decía yo"]



func _fraseNuevaJugadorInicio():
	
	$Label.text=repositorioFrasesJugadorInicio[0]

func _fraseNuevaJugadorFinal():
	
	$Label.text=repositorioFrasesJugadorFinal[0]



func _on_spawn_enemies_dialogo_player_inicio():
	visible=true
	_fraseNuevaJugadorInicio()



func _on_spawn_enemies_dialogo_player_final():
	visible=true
	_fraseNuevaJugadorFinal()
