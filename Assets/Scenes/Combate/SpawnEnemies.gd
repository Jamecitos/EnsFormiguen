extends Area2D


#Variables
const HORMIGA_OBRERA = preload("res://Assets/Scenes/Combate/hormigaObrera.tscn")
const HORMIGA_SOLDADO = preload("res://Assets/Scenes/Combate/hormigaSoldado.tscn")
const HORMIGA_GIGACHAD = preload("res://Assets/Scenes/Combate/hormigaGigachad.tscn")
@onready var BARRA_ENEMIGO = $"../CanvasLayer/Control/ProgressBarEnemy"
const POSICIO_CHILD_ENEMIC:int = 2
var enemicsPendents:int = 3
var recentGenerat:bool = true

var probabilitatTipusFormiga = [1,2,3]
var tamanyGrupFormigues:int =17

var enemigo
signal señalHormiga
signal switchEnableBotons


func _ready():
	_generarEnemigo()
	_actualitzarTamanyGrup()

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
		$"../CanvasLayer/Control"._victoria()


func _retirarEnemigo():
	recentGenerat=false
	switchEnableBotons.emit()
	$Timer.start()
	$"../CanvasLayer/Control/Timer".stop()
	_ocultarDialogos()
	_ocultarPensamiento()

func _ocultarDialogos():
	$"../CanvasLayer/Control/DialoguePlayer".visible=false
	enemigo.get_child(0).visible=false

func _ocultarPensamiento():
	$"../CanvasLayer/Control/DialogueBattle".visible=false

func _mostrarPensamiento():
	$"../CanvasLayer/Control/DialogueBattle".visible=true

func _actualitzarTamanyGrup():
	$"../CanvasLayer/Control/ContadorTamanyGrup".text=str(tamanyGrupFormigues)

func _on_timer_timeout():#Entra/sale enemigo en combate
	if recentGenerat:
		enemigo.position.x += 5
		if enemigo.position.x >= 350:
			$Timer.stop()
			señalHormiga.emit()
			switchEnableBotons.emit()
			$"../CanvasLayer/Control/Timer".start()
			enemigo.get_child(0).visible=true
			_mostrarPensamiento()
	else:
		enemigo.position.x -= 5
		if enemigo.position.x <= 0:
			$Timer.stop()
			_liberarEnemigo()
