extends Container


#Variables
const SIMBOLO = preload("res://Assets/Scenes/Combate/simbolo.tscn")
const signSprite1 = preload("res://Assets/Sprites/xbox_button_color_x.png")
const signSprite2 = preload("res://Assets/Sprites/xbox_button_color_b.png")
const signSprite3 = preload("res://Assets/Sprites/xbox_button_color_a.png")
const signSprite4 = preload("res://Assets/Sprites/xbox_button_color_y.png")
var sequence = [signSprite1, signSprite2, signSprite3, signSprite4]


# Called when the node enters the scene tree for the first time.
func _ready():
	#while $"../ProgressBarPlayer" != 90 or $"../ProgressBarEnemy" != 90
	_generarSequencia(sequence.size(), sequence)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
func _generarSimbolo(x, y, textura):
	var simbolo2 = SIMBOLO.instantiate()
	simbolo2.position.x = x
	simbolo2.position.y = y
	simbolo2.texture = textura
	add_child(simbolo2)
	
func _generarSequencia(numero, arrayTexturas):
	arrayTexturas.shuffle()
	if numero > arrayTexturas.size():
		numero = arrayTexturas.size()
	for i in numero:
		_generarSimbolo(50*(i+1), 50, arrayTexturas[i])
