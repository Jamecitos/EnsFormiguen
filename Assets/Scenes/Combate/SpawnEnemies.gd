extends Area2D


#Variables
const HORMIGA_OBRERA = preload("res://Assets/Scenes/Combate/hormigaObrera.tscn")
const HORMIGA_SOLDADO = preload("res://Assets/Scenes/Combate/hormigaSoldado.tscn")
const HORMIGA_GIGACHAD = preload("res://Assets/Scenes/Combate/hormigaGigachad.tscn")
@onready var BARRA_ENEMIGO = $"../CanvasLayer/Control/ProgressBarEnemy"
const POSICIO_CHILD_ENEMIC:int = 2
var enemicsPendents:int = 1
var recentGenerat:bool = true
@onready var aparece_puzzle = $"../AparecePuzzle"
@onready var ticking_timer = $"../TickingTimer"


var probabilitatTipusFormiga = [1]
var tamanyGrupFormigues:int =17

var enemigo
signal señalHormiga
signal switchEnableBotons

signal dialogoPlayerInicio
signal dialogoPlayerFinal


func _ready():
	_generarEnemigo()
	_actualitzarTamanyGrup()
	ControlMusica.stop_music()
	ControlMusica.stop_music_mapa()

func _process(_delta):
	pass


func _generarEnemigo():
	_escollirTipusEnemicAGenerar()
	recentGenerat=true
	add_child(enemigo)
	$Timer.start()
	BARRA_ENEMIGO.max_value=enemigo.sanity
	BARRA_ENEMIGO.value=enemigo.sanity

func _escollirTipusEnemicAGenerar():
	probabilitatTipusFormiga.shuffle()
	var tipusFormigaGenerar=probabilitatTipusFormiga[0]
	if tipusFormigaGenerar==1:
		enemigo = HORMIGA_OBRERA.instantiate()
	elif tipusFormigaGenerar==2:
		enemigo = HORMIGA_SOLDADO.instantiate()
	else:
		enemigo = HORMIGA_GIGACHAD.instantiate()



func _liberarEnemigo():
	get_child(POSICIO_CHILD_ENEMIC).queue_free()
	enemicsPendents-=1
	tamanyGrupFormigues+=1
	_actualitzarTamanyGrup()
	if enemicsPendents>0:
		_generarEnemigo()
	else:
		ticking_timer.stop()
		$"../CanvasLayer/Control"._victoria()
		get_parent().get_parent().get_child(0).get_child(2).nAnts=tamanyGrupFormigues
		#print(get_parent().get_parent().get_child(0).name)
		get_parent().remove_child($"../")
		$"../".call_deferred("free")


func _retirarEnemigo():
	recentGenerat=false
	switchEnableBotons.emit()
	_ocultarPensamiento()
	dialogoPlayerFinal.emit()
	$"../CanvasLayer/Control/Timer".stop()
	$"../EspacioDialogoDuda".start()



func _ocultarDialogos():
	$"../CanvasLayer/Control/DialoguePlayer".visible=false
	enemigo.get_child(0).visible=false

func _ocultarPensamiento():
	$"../CanvasLayer/Control/DialogueBattle".visible=false

func _mostrarPensamiento():
	$"../CanvasLayer/Control/DialogueBattle".visible=true
	aparece_puzzle.play()

func _actualitzarTamanyGrup():
	$"../CanvasLayer/Control/ContadorTamanyGrup".text=str(tamanyGrupFormigues)

func _on_timer_timeout():#Entra/sale enemigo en combate
	if recentGenerat:
		enemigo.position.x += 10
		enemigo.rotation+=1.2554 #solo activar si se quiere hacer reir al Álvaro
		if enemigo.position.x >= enemigo.UBI:
			enemigo.rotation =0
			$Timer.stop()
			$"../EspacioDialogo".start()
			enemigo.get_child(0).visible=true
			dialogoPlayerInicio.emit()
	else:
		enemigo.position.x -= 10
		if enemigo.position.x <= 0:
			$Timer.stop()
			_liberarEnemigo()


func _on_espacio_dialogo_timeout():
	señalHormiga.emit()
	switchEnableBotons.emit()
	$"../CanvasLayer/Control/Timer".start()
	_mostrarPensamiento()


func _on_espacio_dialogo_duda_timeout():
	$Timer.start()
	_ocultarDialogos()
