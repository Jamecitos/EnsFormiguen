extends Control


#Variables:
const rapidezContador:float = 0.1
var gameOver:bool=false

func _process(_delta):
	if not $"../../AudioStreamPlayer".playing and not gameOver:
		$"../../AudioStreamPlayer".play()

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
	gameOver=true
	$"../../AudioStreamPlayer".stop()
