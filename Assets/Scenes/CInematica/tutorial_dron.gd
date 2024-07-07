extends Node2D

# Variables
@onready var background = $Background
@onready var santi = $Santi
@onready var anthony = $Anthony
@onready var enemy = $Enemy
@onready var text_anthony = $TextAnthony
@onready var label_anthony = $TextAnthony/LabelAnthony
@onready var texture_button = $TextureButton
@onready var musica_tutorial = $MusicaTuto
var timer : float
var animation_duration : float
var if_touch_pressed : bool
@export var current_animation : int
const ANIMATION_DURATION = 2

func _ready():
	musica_tutorial.play()
	TranslationServer.set_locale("ca")
	timer = 0.0
	current_animation = 0
	animation_duration = ANIMATION_DURATION
	if_touch_pressed = false
	background.visible = true
	santi.visible = false
	anthony.visible = false
	enemy.visible = false
	text_anthony.visible = false
	label_anthony.visible = false
	texture_button.visible = false


func _process(_delta):
	timer += _delta
	if timer >= animation_duration:
		timer = 0.0
		if current_animation <= 2:
			current_animation +=1
			change_animation()
		else:
			if current_animation >= 3:
				texture_button.visible = true
				if if_touch_pressed == true:
					current_animation +=1
					if_touch_pressed = false
					change_animation()
				else:
					current_animation = current_animation


func change_animation():
	match current_animation:
		1:
			santi.visible = true
			anthony.visible = true
		2:
			enemy.visible = true
		3:
			text_anthony.visible = true
			label_anthony.text = tr("txt_tutorial7")
			label_anthony.visible = true
		4:
			get_parent().get_child(0).get_child(2).create_CombatTuto3()
			get_parent().remove_child($".")
			$".".call_deferred("free")


func _on_texture_button_pressed():
	if_touch_pressed = true
	return if_touch_pressed
