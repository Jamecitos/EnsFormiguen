extends Container


#Variables
const SIMBOLO = preload("res://Assets/Scenes/Combate/simbolo.tscn")
var secuenciaEnemigo = []


# Called when the node enters the scene tree for the first time.
func _ready():
	#while $"../ProgressBarPlayer" != 90 or $"../ProgressBarEnemy" != 90
	_generarSecuencia(secuenciaEnemigo.size(), secuenciaEnemigo)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
func _generarSimbolo(x, y, textura):
	var simbolo2 = SIMBOLO.instantiate()
	simbolo2.position.x = x
	simbolo2.position.y = y
	simbolo2.texture = textura
	add_child(simbolo2)


func _generarSecuencia(numero, arrayTexturas):
	arrayTexturas.shuffle()
	if numero > arrayTexturas.size():
		numero = arrayTexturas.size()
	for i in numero:
		_generarSimbolo(50*(i+1), 50, arrayTexturas[i])


func _resetSecuenciaEnemigo():
	for child in get_children():
		child.queue_free()
	_generarSecuencia(secuenciaEnemigo.size(), secuenciaEnemigo)
