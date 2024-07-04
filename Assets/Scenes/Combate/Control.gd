extends Control


#Variables:
var empiezaTiempo:bool = false
const rapidezContador:int = 1


func _on_timer_timeout():
	if empiezaTiempo:
		$ProgressBarTime.value -= rapidezContador


func _on_timer_2_timeout():
	empiezaTiempo = true
