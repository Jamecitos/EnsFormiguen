extends CharacterBody2D
 
var speed = 200
@onready var nav: NavigationAgent2D = $NavigationAgent2D
@onready var button1: Button = $"../Cueva1"
@onready var button2: Button = $"../Cueva2"
@onready var button3: Button = $"../Cueva3"
@onready var button4: Button = $"../Cueva4"
	
func _physics_process(delta):
	
	if button1.button_pressed:
		print(button1.position)
		nav.target_position = button1.position
	if button2.button_pressed:
		print(button2.position)
		nav.target_position = button2.position
	if button3.button_pressed:
		print(button3.position)
		nav.target_position = button3.position
	if button4.button_pressed:
		print(button4.position)
		nav.target_position = button4.position
	
	var target_position = nav.get_next_path_position()
	
	var direction = target_position - global_position
	
	if target_position.distance_to(global_position) > 2:
		velocity = direction.normalized() * speed
		move_and_slide()
