extends Location
class_name cuevita

var has_been_pressed: bool
@export var enemicsPendents:int
@export var probabilitatTipusFormiga:Array
@export var llargadaSecuencia:Array

@export var tuto1:bool
@export var tuto2:bool
@export var tuto3:bool
@export var boss:bool

func _ready():
	has_been_pressed = false
