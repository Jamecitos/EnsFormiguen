extends Node2D

# Variables
@onready var camera_2d = $Camera2D
@onready var background = $Background
@onready var anthony = $Anthony
@onready var text_anthony = $Anthony/TextAnthony
@onready var label_anthony = $Anthony/TextAnthony/LabelAnthony
@onready var label_anthony_2 = $Anthony/TextAnthony/LabelAnthony2
@onready var label_anthony_3 = $Anthony/TextAnthony/LabelAnthony3
@onready var label_anthony_4 = $Anthony/TextAnthony/LabelAnthony4
@onready var santi = $Santi
@onready var text_santi = $Santi/TextSanti
@onready var label_santi = $Santi/LabelSanti
@onready var label_santi_2 = $Santi/LabelSanti2
@onready var texture_button = $TextureButton
@onready var animation_player = $AnimationPlayer
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
	santi.visible = true
	anthony.visible = true
	text_anthony.visible = false
	label_anthony.visible = false
	label_anthony_2.visible = false
	label_anthony_3.visible = false
	label_anthony_4.visible = false
	text_santi.visible = false
	label_santi.visible = false
	label_santi_2.visible = false
	texture_button.visible = false
	camera_2d.position.y = 992


func _process(_delta):
	timer += _delta
	if timer >= animation_duration:
		timer = 0.0
		if current_animation <= 1:
			current_animation +=1
			change_animation()
		else:
			if current_animation >= 1:
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
			animation_player.play("cameraAnim")
		2:
			camera_2d.position.y = 360
			text_anthony.visible = true
			label_anthony.text = tr("txt_intro1")
			label_anthony.visible = true
		3:
			text_anthony.visible = false
			label_anthony.visible = false
			text_santi.visible = true
			label_santi.text = tr("txt_intro2")
			label_santi.visible = true
		4:
			text_santi.visible = false
			label_santi.visible = false
			_on_santi_texture_changed()
		5:
			text_anthony.visible = true
			label_anthony_2.text = tr("txt_intro3")
			label_anthony_2.visible = true
		6:
			label_anthony_2.visible = false
			label_anthony_3.text = tr("txt_intro4")
			label_anthony_3.visible = true
		7:
			text_anthony.visible = false
			label_anthony_3.visible = false
			text_santi.visible = true
			label_santi_2.text = tr("txt_intro5")
			label_santi_2.visible = true
		8:
			text_santi.visible = false
			label_santi_2.visible = false
			text_anthony.visible = true
			label_anthony_4.text = tr("txt_intro6")
			label_anthony_4.visible = true
		9:
			get_tree().change_scene_to_file("res://Assets/Scenes/Mapa/MainScene.tscn")


func _on_texture_button_pressed():
	if_touch_pressed = true
	return if_touch_pressed


func _on_santi_texture_changed():
	santi.texture = preload("res://Assets/Scenes/CInematica/Cinemarica Alien.png")
