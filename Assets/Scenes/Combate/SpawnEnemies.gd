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
var enemigo
signal señalHormiga
signal switchEnableBotons


func _ready():
	_generarEnemigo()

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
	if enemicsPendents>0:
		_generarEnemigo()
	else:
		pass#victoria!!!

func _retirarEnemigo():
	recentGenerat=false
	switchEnableBotons.emit()
	$Timer.start()

func _on_timer_timeout():#Entra/sale enemigo en combate
	if recentGenerat:
		enemigo.position.x += 5
		if enemigo.position.x >= 400:
			$Timer.stop()
			señalHormiga.emit()
			switchEnableBotons.emit()
	else:
		enemigo.position.x -= 5
		if enemigo.position.x <= 0:
			$Timer.stop()
			_liberarEnemigo()
