extends TextureRect


#Variables
@onready var texturaBoton1 = $"../ControlPanel/TextureButton1"
@onready var texturaBoton2 = $"../ControlPanel/TextureButton2"
@onready var texturaBoton3 = $"../ControlPanel/TextureButton3"
@onready var texturaBoton4 = $"../ControlPanel/TextureButton4"
@onready var nodoPuzzlePanel = $"../PuzzlePanel"
const SIMBOLO = preload("res://Assets/Scenes/Combate/simbolo.tscn")
const corduraGanada = 30
var x = 55
var y = 55
var secuenciaJugador = []
var secuenciaEnem = []


func _on_texture_button_1_button_down():
	_botonPulsado(texturaBoton1.texture_normal)


func _on_texture_button_2_button_down():
	_botonPulsado(texturaBoton2.texture_normal)


func _on_texture_button_3_button_down():
	_botonPulsado(texturaBoton3.texture_normal)


func _on_texture_button_4_button_down():
	_botonPulsado(texturaBoton4.texture_normal)


func _añadirSimbolo(textura):
	var simbolo2 = SIMBOLO.instantiate()
	var tamañoSecuencia = secuenciaJugador.size()
	simbolo2.position.x = x * tamañoSecuencia
	simbolo2.position.y = y
	simbolo2.texture = textura
	add_child(simbolo2)


func _comparacionSecuencias():
	for i in secuenciaJugador.size():
		if secuenciaJugador[i] != secuenciaEnem[i]:
			_sequenciaFallida()
			return false
	return true


func _sequenciaCompletada():
	var barraEnemigo = $"../ProgressBarEnemy"
	barraEnemigo.value -= corduraGanada
	_resetSecuenciaJugador()
	nodoPuzzlePanel._resetSecuenciaEnemigo()


func _sequenciaFallida():
	var barraPlayer = $"../ProgressBarPlayer"
	barraPlayer.value += corduraGanada


func _resetSecuenciaJugador():
	secuenciaJugador.clear()
	for child in get_children():
		child.queue_free()


func _botonPulsado(textura):
	secuenciaJugador.append(textura)
	if secuenciaJugador.size() == secuenciaEnem.size() \
	and _comparacionSecuencias():
		_sequenciaCompletada()
	elif _comparacionSecuencias():
		_añadirSimbolo(textura)
	else:
		_resetSecuenciaJugador()


func _on_spawn_enemies_señal_hormiga():
	texturaBoton1.disabled = false
	texturaBoton2.disabled = false
	texturaBoton3.disabled = false
	texturaBoton4.disabled = false


func _on_puzzle_panel_codigo_listo():
	secuenciaEnem = $"../PuzzlePanel".secuenciaEnemigo
