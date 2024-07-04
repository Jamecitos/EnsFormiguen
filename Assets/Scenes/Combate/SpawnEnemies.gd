extends Area2D


#Variables
const HORMIGA_OBRERA = preload("res://Assets/Scenes/Combate/hormigaObrera.tscn")
var enemigo
signal señalHormiga


func _ready():
	_generarEnemigo()

func _process(_delta):
	pass


func _generarEnemigo():
	enemigo = HORMIGA_OBRERA.instantiate()
	add_child(enemigo)
	$Timer.start()


func _on_timer_timeout():#Entra enemigo en combate
	enemigo.position.x += 5
	if enemigo.position.x >= 400:
		$Timer.stop()
		señalHormiga.emit()
