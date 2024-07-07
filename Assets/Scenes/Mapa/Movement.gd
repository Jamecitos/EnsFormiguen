extends CharacterBody2D

var buttons: Array[Button]
var speed = 200
var nAnts: int
@onready var nav: NavigationAgent2D = $NavigationAgent2D
@onready var combat_scene = preload("res://Assets/Scenes/Combate/combat.tscn")
func _ready():
	for child in get_parent().get_children():
		if child is Button:
			buttons.append(child)

func _physics_process(delta):
	for button in buttons:
		if(button.button_pressed):
			nav.target_position = button.global_position + button.size*.5
		if(button is cuevita):
			if(!button.has_been_pressed):
				if (button.global_position + button.size*.5).distance_to(global_position) < 3:
					#$"../..".get_child(0).hide()
					create_combat()
					button.has_been_pressed = true
	
	var target_position = nav.get_next_path_position()
	
	var direction = target_position - global_position
	
	if target_position.distance_to(global_position) > 2:
		velocity = direction.normalized() * speed
		move_and_slide()

func create_combat():
	var elements_position_adjustment = Vector2(-639, -359)
	var new_combat = combat_scene.instantiate()
	new_combat.position = $Camera2D.global_position
	new_combat.get_child(1).tamanyGrupFormigues = 99
	new_combat.get_child(1).probabilitatTipusFormiga = [1]
	new_combat.get_child(1).enemicsPendents = 1
	new_combat.get_child(1).position += elements_position_adjustment
	new_combat.get_child(3).position += elements_position_adjustment
	new_combat.get_child(4).position += elements_position_adjustment
	new_combat.get_child(5).position += elements_position_adjustment
	new_combat.get_child(6).position += elements_position_adjustment
	new_combat.get_child(9).position += elements_position_adjustment
	$"../..".add_child(new_combat)
