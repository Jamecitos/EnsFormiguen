extends CharacterBody2D
 
var speed = 800
@onready var nav: NavigationAgent2D = $NavigationAgent2D
	
func _physics_process(delta):
	
	if Input.is_action_just_pressed("right_click"):		
		nav.target_position = get_global_mouse_position()
	
	var target_position = nav.get_next_path_position()
	
	var direction = target_position - global_position
	
	if target_position.distance_to(global_position) > 0:
		velocity = direction.normalized() * speed
		move_and_slide()

