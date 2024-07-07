class_name Gigachad
extends Sprite2D


#Variables
const nom:String="Gigachad"#repetitiu pero util per evitar problemes al instanciar
var sanity = 120


const signSprite1 = preload("res://Assets/Sprites/UI/iconos/hormiga.png")
const signSprite2 = preload("res://Assets/Sprites/UI/iconos/gusano.png")
const signSprite3 = preload("res://Assets/Sprites/UI/iconos/ovni.png")
const signSprite4 = preload("res://Assets/Sprites/UI/iconos/tierra.png")
const vocabulario = [signSprite1, signSprite2, signSprite3, signSprite4]
const UBI:int=360


var frasesDuda = ["Pues ahora \nque lo \ndices...","Esto...","A ver, \nvisto asi..."]
var frasesEntrada = ["Los osos \nhormiguero \nno existen","¡Las moscas\n nos fumigan!","Esa miel \nestaba \ndeliciosa..."]

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
