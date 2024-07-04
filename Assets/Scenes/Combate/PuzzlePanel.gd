extends Container


#Variables
const SIMBOLO = preload("res://Assets/Scenes/Combate/simbolo.tscn")
var secuenciaEnemigo = []
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


func _generarSecuencia(numero, arrayTexturas):
	arrayTexturas.shuffle()
	if numero > arrayTexturas.size():
		numero = arrayTexturas.size()
	for i in numero:
		_generarSimbolo(50*(i+1), 50, arrayTexturas[i])
	codigoListo.emit()


func _resetSecuenciaEnemigo():
	for child in get_children():
		child.queue_free()
	_generarSecuencia(secuenciaEnemigo.size(), secuenciaEnemigo)


func _on_spawn_enemies_señal_hormiga():
	secuenciaEnemigo = $"../../../SpawnEnemies".get_child(2).vocabulario
	_generarSecuencia(secuenciaEnemigo.size(), secuenciaEnemigo)
