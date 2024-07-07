class_name Obrera
extends Sprite2D


#Variables
const nom:String="Obrera"#repetitiu pero util per evitar problemes al instanciar
var sanity = 60


const signSprite1 = preload("res://Assets/Sprites/UI/iconos/bacteria.png")
const signSprite2 = preload("res://Assets/Sprites/UI/iconos/crazy.png")
const signSprite3 = preload("res://Assets/Sprites/UI/iconos/flor.png")
const signSprite4 = preload("res://Assets/Sprites/UI/iconos/hoja.png")
const vocabulario = [signSprite1, signSprite2, signSprite3, signSprite4]
const UBI:int=350
var nums=[1]

var frasesDuda = [tr("txt_convencido11")]
var frasesEntrada = [tr("txt_pregunta11")]
@onready var label = $DialogueEnemy/Label

#to-do sonidos propios

func _ready():
	_dialogoEntrada()

func _dialogoEntrada():
	frasesEntrada.shuffle()
	label.text=frasesEntrada[0]

func _dialogoDuda():
	frasesDuda.shuffle()
	label.text=frasesDuda[0]








#func aparecerDialogo():
	#animacion - fade-in
