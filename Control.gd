extends Control

#Variables:
var empiezaTiempo:bool = false
const rapidezContador:int = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_timer_timeout():
	if empiezaTiempo:
		$ProgressBarTime.value -=rapidezContador


func _on_timer_2_timeout():
	empiezaTiempo = true
