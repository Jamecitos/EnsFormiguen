class_name Soldado
extends Sprite2D


#Variables
const nom:String="Soldado"#repetitiu pero util per evitar problemes al instanciar
var sanity = 90


const signSprite1 = preload("res://Assets/Sprites/UI/iconos/frasco.png")
const signSprite2 = preload("res://Assets/Sprites/UI/iconos/jeringuilla.png")
const signSprite3 = preload("res://Assets/Sprites/UI/iconos/saturno.png")
const signSprite4 = preload("res://Assets/Sprites/UI/iconos/fuego.png")
const vocabulario = [signSprite1, signSprite2, signSprite3, signSprite4]



var frasesDuda = ["Pues ahora \nque lo \ndices...","Esto...","A ver, \nvisto asi..."]
var frasesEntrada = ["Los osos \nhormiguero \nno esisten","¡Las moscas\n nos fumigan!","Esa miel \nestaba \ndeliciosa..."]
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
