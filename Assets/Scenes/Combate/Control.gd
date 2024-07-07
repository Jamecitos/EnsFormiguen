extends Control


#Variables:
const rapidezContador:float = 0.1
var gameOver:bool=false
var tictacUp:bool=false
@onready var ticking_timer = $"../../TickingTimer"
var num:int=0


func _process(_delta):
	if not $"../../AudioStreamPlayer".playing and not gameOver:
		$"../../AudioStreamPlayer".play()

func _on_timer_timeout():
	$ProgressBarTime.value -= rapidezContador
	if($ProgressBarTime.value<=17 and not tictacUp):
		tictacUp=true
		ticking_timer.play()
	if($ProgressBarTime.value<=0):
		ticking_timer.stop()
		_derrota()



func _victoria():
	$"../../Victoria".visible=true
	_finalCombat()

func _derrota():
	$"../../Derrota".visible=true
	get_tree().quit()
	_finalCombat()

func _finalCombat():
	$Timer.stop()
	gameOver=true
	$"../../AudioStreamPlayer".stop()




func _on_boton_pausa_pressed():
	$"../../MenuPausa".visible=true
	get_tree().paused=true
