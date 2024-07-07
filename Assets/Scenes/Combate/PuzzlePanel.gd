extends Container


#Variables
const SIMBOLO = preload("res://Assets/Scenes/Combate/simbolo.tscn")
const maxCadenaSimbols:int=15
var llargadaSecuencia=[7]
@onready var controlEnemics = $"../../../SpawnEnemies"

var secuenciaEnemigo = []
var vocabularioEnemigo=[]
signal codigoListo


func _ready():
	pass
	#while $"../ProgressBarPlayer" != 90 or $"../ProgressBarEnemy" != 90


func _process(_delta):
	pass
	
func _generarSimbolo(x, y, textura):
	var simbolo2 = SIMBOLO.instantiate()
	simbolo2.position.x = x
	simbolo2.position.y = y
	simbolo2.texture = textura
	add_child(simbolo2)

func _llargadaSecuencia():
	llargadaSecuencia.shuffle()
	return llargadaSecuencia[0]

func _generarSecuencia(numero, arrayTexturas):
	var offset:int=65
	secuenciaEnemigo.clear()
	if numero > maxCadenaSimbols:
		numero = maxCadenaSimbols
	for i in numero:
		arrayTexturas.shuffle()
		_generarSimbolo(65*(i+1)+offset, 70, arrayTexturas[0])
		secuenciaEnemigo.append(arrayTexturas[0])
	codigoListo.emit()


func _resetSecuenciaEnemigo():
	for child in get_children():
		child.queue_free()
	_generarSecuencia(_llargadaSecuencia(), vocabularioEnemigo)


func _limpiarSecuenciaEnemigo():
	for child in get_children():
		child.queue_free()



func _on_spawn_enemies_señal_hormiga():
	var copiaSecuencia = controlEnemics.get_child(controlEnemics.POSICIO_CHILD_ENEMIC).vocabulario
	vocabularioEnemigo = copiaSecuencia.duplicate()
	_generarSecuencia(_llargadaSecuencia(), vocabularioEnemigo)
