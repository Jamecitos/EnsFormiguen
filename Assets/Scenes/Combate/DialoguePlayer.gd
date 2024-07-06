extends TextureRect


# Called when the node enters the scene tree for the first time.
var repositorioFrasesJugador=["No.","A mi que \nme cuentas","Basadon't","Y cómo \nexplicas \nesta pedazo \nde trompa?"]


func _fraseNuevaJugador():
	repositorioFrasesJugador.shuffle()
	$Label.text=repositorioFrasesJugador[0]


func _on_control_panel_2_secuencia_acertada():
	visible=true
	_fraseNuevaJugador()
