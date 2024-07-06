extends CharacterBody2D
 
var speed = 200
var buttons: Array[Button]
@onready var nav: NavigationAgent2D = $NavigationAgent2D

func _ready():	
	for child in get_parent().get_children():
		if child is Button:
			buttons.append(child)

func _physics_process(delta):
	for button in buttons:
		if(button.button_pressed):
			nav.target_position = button.global_position + button.size*.5
	
	var target_position = nav.get_next_path_position()
	
	var direction = target_position - global_position
	
	if target_position.distance_to(global_position) > 2:
		velocity = direction.normalized() * speed
		move_and_slide()
	for button in buttons:
		if(button.name.contains("Cueva")):
			#if(!button.has_been_pressed):
				if (button.global_position + button.size*.5).distance_to(global_position) < 3:
					get_tree().change_scene_to_file("res://Assets/Scenes/Combate/combat.tscn")
					#button.has_been_pressed = true
