extends Control


#Variables:
const rapidezContador:float = 0.5


func _on_timer_timeout():
	$ProgressBarTime.value -= rapidezContador
	if($ProgressBarTime.value<=0):
		_derrota()


func _victoria():
	$"../../Victoria".visible=true
	_finalCombat()

func _derrota():
	$"../../Derrota".visible=true
	_finalCombat()

func _finalCombat():
	$Timer.stop()
	$ControlPanel/TextureButton1.disabled=true
	$ControlPanel/TextureButton2.disabled=true
	$ControlPanel/TextureButton3.disabled=true
	$ControlPanel/TextureButton4.disabled=true
