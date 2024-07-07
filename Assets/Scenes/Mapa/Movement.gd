extends CharacterBody2D

var locations: Array[Location]
var speed = 200
var nAnts: int =1
@onready var nav: NavigationAgent2D = $NavigationAgent2D
@onready var combat_scene = preload("res://Assets/Scenes/Combate/combat.tscn")
func _ready():
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
	print(cueva.enemicsPendents)
	new_combat.get_child(1).position += elements_position_adjustment
	new_combat.get_child(3).position += elements_position_adjustment
	new_combat.get_child(4).position += elements_position_adjustment
	new_combat.get_child(5).position += elements_position_adjustment
	new_combat.get_child(6).position += elements_position_adjustment
	new_combat.get_child(9).position += elements_position_adjustment
	$"../..".add_child(new_combat)

func enable_colindant(lloc:Location):
	for loc in locations:
		loc.disabled = lloc.covesColindants.find(loc) == -1
