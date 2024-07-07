extends TextureRect


#Variables
@onready var texturaBoton1 = $"../ControlPanel/TextureButton1"
@onready var texturaBoton2 = $"../ControlPanel/TextureButton2"
@onready var texturaBoton3 = $"../ControlPanel/TextureButton3"
@onready var texturaBoton4 = $"../ControlPanel/TextureButton4"
@onready var nodoPuzzlePanel = $"../PuzzlePanel"
@onready var progress_bar_enemy = $"../ProgressBarEnemy"
@onready var controlEnemigos = $"../../../SpawnEnemies"

const SIMBOLO = preload("res://Assets/Scenes/Combate/simbolo.tscn")
const corduraGanada = 30
var x = 65
var y = 55
var secuenciaJugador = []
var secuenciaEnem = []

@onready var sorollBotonsCombat:AudioStreamPlayer = $"../../../botonsCombat"



func _on_texture_button_1_button_down():
	_botonPulsado(texturaBoton1.texture_normal)
	sorollBotonsCombat.play()

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
	var tipusFormiga:String=controlEnemigos.enemigo.nom
	if tipusFormiga=="Obrera":
		for i in secuenciaJugador.size():
			if secuenciaJugador[i] != secuenciaEnem[i]:
				_sequenciaFallida()
				return false
		return true
	elif tipusFormiga=="Soldado":
		var tamanySecuenciaEnemiga = secuenciaEnem.size()
		for i in secuenciaJugador.size():
			if secuenciaJugador[i] != secuenciaEnem[tamanySecuenciaEnemiga-i-1]:
				_sequenciaFallida()
				return false
		return true
	else:
		for i in secuenciaJugador.size():
			if secuenciaJugador[i] == secuenciaEnem[i]:
				_sequenciaFallida()
				return false
		return true


func _sequenciaCompletada():
	var barraEnemigo = $"../ProgressBarEnemy"
	barraEnemigo.value -= corduraGanada
	_resetSecuenciaJugador()
	#controlEnemigos.enemigo._dialogoDuda()
	
	if barraEnemigo.value<=0:
		controlEnemigos.enemigo._dialogoDuda()
		nodoPuzzlePanel._limpiarSecuenciaEnemigo()
		controlEnemigos._retirarEnemigo()
		
	else:
		nodoPuzzlePanel._resetSecuenciaEnemigo()
	



func _sequenciaFallida():
	var barraPlayer = $"../ProgressBarPlayer"
	barraPlayer.value += corduraGanada
	#controlEnemigos.enemigo._dialogoEntrada()
	_switchDisabledButton()
	$"../../../cooldownError".start()
	
	if barraPlayer.value >=90:
		barraPlayer.value=0
		if _perduaMembreGrup()<=0:
			$".."._derrota()

func _perduaMembreGrup():
	$"../../../SpawnEnemies".tamanyGrupFormigues-=1
	$"../../../SpawnEnemies"._actualitzarTamanyGrup()
	return $"../../../SpawnEnemies".tamanyGrupFormigues

func _resetSecuenciaJugador():
	secuenciaJugador.clear()
	for child in get_children():
		child.queue_free()


func _botonPulsado(textura):
	secuenciaJugador.append(textura)
	if secuenciaJugador.size() >= secuenciaEnem.size() \
	and _comparacionSecuencias():
		_sequenciaCompletada()
	elif not secuenciaJugador.size() >= secuenciaEnem.size() \
	and _comparacionSecuencias():
		_añadirSimbolo(textura)
	else:
		_resetSecuenciaJugador()

func _switchDisabledButton():
	texturaBoton1.disabled = not texturaBoton1.disabled
	texturaBoton2.disabled = not texturaBoton2.disabled
	texturaBoton3.disabled = not texturaBoton3.disabled
	texturaBoton4.disabled = not texturaBoton4.disabled

func _on_puzzle_panel_codigo_listo():
	secuenciaEnem = $"../PuzzlePanel".secuenciaEnemigo
	texturaBoton1.texture_normal=$"../PuzzlePanel".vocabularioEnemigo[0]
	texturaBoton2.texture_normal=$"../PuzzlePanel".vocabularioEnemigo[1]
	texturaBoton3.texture_normal=$"../PuzzlePanel".vocabularioEnemigo[2]
	texturaBoton4.texture_normal=$"../PuzzlePanel".vocabularioEnemigo[3]



func _on_spawn_enemies_switch_enable_botons():
	_switchDisabledButton()


func _on_cooldown_error_timeout():
	if not $"..".gameOver:
		_switchDisabledButton()
