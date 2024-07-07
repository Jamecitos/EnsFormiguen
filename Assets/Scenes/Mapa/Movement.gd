extends CharacterBody2D

var locations: Array[Location]
var speed = 200
var nAnts: int =1
@onready var nav: NavigationAgent2D = $NavigationAgent2D
@onready var combat_scene = preload("res://Assets/Scenes/Combate/combat.tscn")
const BOSS = preload("res://Assets/Scenes/Combate/boss.tscn")
const TUTORIAL_OBRERA = preload("res://Assets/Scenes/CInematica/tutorial_obrera.tscn")
const TUTORIAL_SOLDADO = preload("res://Assets/Scenes/CInematica/tutorial_soldado.tscn")
const TUTORIAL_DRON = preload("res://Assets/Scenes/CInematica/tutorial_dron.tscn")

func _ready():
	ControlMusica.play_music_tunel()
	for child in get_parent().get_children():
		if child is Location:
			locations.append(child)

func _physics_process(delta):
			
	for location in locations:
		if(location.button_pressed && nav.is_navigation_finished()):
			nav.target_position = location.global_position + location.size*.5
			enable_colindant(location)
		if(location is cuevita):
			if(!location.has_been_pressed):
				if (location.global_position + location.size*.5).distance_to(global_position) < 3:
					ControlMusica.stop_music_tunel()
					if(location.tuto1):
						tuto1(location)
						location.has_been_pressed = true
					elif(location.tuto2):
						tuto2(location)
						location.has_been_pressed = true
					elif(location.tuto3):
						tuto3(location)
						location.has_been_pressed = true
					elif(location.boss):
						create_boss(location)
						location.has_been_pressed = true
					else:
						create_combat(location)
						location.has_been_pressed = true
	
	var target_position = nav.get_next_path_position()
	
	var direction = target_position - global_position
	
	if target_position.distance_to(global_position) > 2:
		velocity = direction.normalized() * speed
		move_and_slide()

func create_combat(cueva:cuevita):
	var elements_position_adjustment = Vector2(-639, -359)
	var new_combat = combat_scene.instantiate()
	new_combat.position = $Camera2D.global_position
	new_combat.get_child(1).tamanyGrupFormigues = nAnts
	new_combat.get_child(1).probabilitatTipusFormiga = cueva.probabilitatTipusFormiga
	new_combat.get_child(1).enemicsPendents = cueva.enemicsPendents
	new_combat.get_child(0).get_child(0).get_child(10).llargadaSecuencia =cueva.llargadaSecuencia
	new_combat.get_child(1).position += elements_position_adjustment
	new_combat.get_child(3).position += elements_position_adjustment
	new_combat.get_child(4).position += elements_position_adjustment
	new_combat.get_child(5).position += elements_position_adjustment
	new_combat.get_child(6).position += elements_position_adjustment
	new_combat.get_child(11).position += elements_position_adjustment
	$"../..".add_child(new_combat)

func enable_colindant(lloc:Location):
	for loc in locations:
		loc.disabled = lloc.covesColindants.find(loc) == -1

func tuto1(cueva):
	var elements_position_adjustment = Vector2(18, 352)
	var tuto=TUTORIAL_OBRERA.instantiate()
	tuto.position = elements_position_adjustment
	#tuto.get_child(0).position += elements_position_adjustment 
	$"../..".add_child(tuto)

func tuto2(cueva):
	var elements_position_adjustment = Vector2(423, 1780)
	var tuto=TUTORIAL_SOLDADO.instantiate()
	tuto.position = elements_position_adjustment
	#tuto.get_child(0).position += elements_position_adjustment 
	$"../..".add_child(tuto)
	
func tuto3(cueva):
	var elements_position_adjustment = Vector2(313-640, 3908-360)
	var tuto=TUTORIAL_DRON.instantiate()
	tuto.position = elements_position_adjustment
	#tuto.get_child(0).position += elements_position_adjustment 
	$"../..".add_child(tuto)

func create_boss(cueva:cuevita):
	var elements_position_adjustment = Vector2(-639, -359)
	var new_combat = BOSS.instantiate()
	new_combat.position = $Camera2D.global_position
	new_combat.get_child(1).tamanyGrupFormigues = nAnts
	new_combat.get_child(1).probabilitatTipusFormiga = cueva.probabilitatTipusFormiga
	new_combat.get_child(1).enemicsPendents = cueva.enemicsPendents
	new_combat.get_child(0).get_child(0).get_child(10).llargadaSecuencia =cueva.llargadaSecuencia
	new_combat.get_child(1).position += elements_position_adjustment
	new_combat.get_child(3).position += elements_position_adjustment
	new_combat.get_child(4).position += elements_position_adjustment
	new_combat.get_child(5).position += elements_position_adjustment
	new_combat.get_child(6).position += elements_position_adjustment
	new_combat.get_child(11).position += elements_position_adjustment
	$"../..".add_child(new_combat)

func create_CombatTuto1():
	var elements_position_adjustment = Vector2(-639, -359)
	var new_combat = combat_scene.instantiate()
	new_combat.position = $Camera2D.global_position
	new_combat.get_child(1).tamanyGrupFormigues = nAnts
	new_combat.get_child(1).probabilitatTipusFormiga = [1]
	new_combat.get_child(1).enemicsPendents = 1
	new_combat.get_child(0).get_child(0).get_child(10).llargadaSecuencia =[4]
	new_combat.get_child(1).position += elements_position_adjustment
	new_combat.get_child(3).position += elements_position_adjustment
	new_combat.get_child(4).position += elements_position_adjustment
	new_combat.get_child(5).position += elements_position_adjustment
	new_combat.get_child(6).position += elements_position_adjustment
	new_combat.get_child(11).position += elements_position_adjustment
	$"../..".add_child(new_combat)

func create_CombatTuto2():
	var elements_position_adjustment = Vector2(-639, -359)
	var new_combat = combat_scene.instantiate()
	new_combat.position = $Camera2D.global_position
	new_combat.get_child(1).tamanyGrupFormigues = nAnts
	new_combat.get_child(1).probabilitatTipusFormiga = [2]
	new_combat.get_child(1).enemicsPendents = 1
	new_combat.get_child(0).get_child(0).get_child(10).llargadaSecuencia =[4]
	new_combat.get_child(1).position += elements_position_adjustment
	new_combat.get_child(3).position += elements_position_adjustment
	new_combat.get_child(4).position += elements_position_adjustment
	new_combat.get_child(5).position += elements_position_adjustment
	new_combat.get_child(6).position += elements_position_adjustment
	new_combat.get_child(11).position += elements_position_adjustment
	$"../..".add_child(new_combat)

func create_CombatTuto3():
	var elements_position_adjustment = Vector2(-639, -359)
	var new_combat = combat_scene.instantiate()
	new_combat.position = $Camera2D.global_position
	new_combat.get_child(1).tamanyGrupFormigues = nAnts
	new_combat.get_child(1).probabilitatTipusFormiga = [3]
	new_combat.get_child(1).enemicsPendents = 1
	new_combat.get_child(0).get_child(0).get_child(10).llargadaSecuencia =[4]
	new_combat.get_child(1).position += elements_position_adjustment
	new_combat.get_child(3).position += elements_position_adjustment
	new_combat.get_child(4).position += elements_position_adjustment
	new_combat.get_child(5).position += elements_position_adjustment
	new_combat.get_child(6).position += elements_position_adjustment
	new_combat.get_child(11).position += elements_position_adjustment
	$"../..".add_child(new_combat)
