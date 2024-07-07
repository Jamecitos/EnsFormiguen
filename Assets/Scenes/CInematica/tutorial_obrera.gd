extends Node2D

# Variables
@onready var background = $Background
@onready var santi = $Santi
@onready var anthony = $Anthony
@onready var enemy = $Enemy
@onready var botton_panel = $BottonPanel
@onready var time_progress_bar = $TimeProgressBar
@onready var cloud_dialogue = $CloudDialogue
@onready var text_anthony = $TextAnthony
@onready var label_anthony = $TextAnthony/LabelAnthony
@onready var label_anthony_2 = $TextAnthony/LabelAnthony2
@onready var label_anthony_3 = $TextAnthony/LabelAnthony3
@onready var label_anthony_4 = $TextAnthony/LabelAnthony4
@onready var text_enemy = $TextEnemy
@onready var label_enemy = $TextEnemy/LabelEnemy
@onready var texture_button = $TextureButton
@onready var musica_tutorial : AudioStreamPlayer = $MusicaTuto
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
	botton_panel.visible = false
	time_progress_bar.visible = false
	cloud_dialogue.visible = false
	text_anthony.visible = false
	label_anthony.visible = false
	label_anthony_2.visible = false
	label_anthony_3.visible = false
	label_anthony_4.visible = false
	text_enemy.visible = false
	label_enemy.visible = false
	texture_button.visible = false


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
			santi.visible = true
			anthony.visible = true
		2:
			text_anthony.visible = true
			label_anthony.text = tr("txt_tutorial1")
			label_anthony.visible = true
			enemy.visible = true
		3:
			text_anthony.visible = false
			label_anthony.visible = false
			text_enemy.visible = true
			label_enemy.text = tr("txt_tutorial2")
			label_enemy.visible = true
		4:
			text_enemy.visible = false
			label_enemy.visible = false
			text_anthony.visible = true
			label_anthony_2.text = tr("txt_tutorial3")
			label_anthony_2.visible = true
		5:
			enemy.visible = false
			label_anthony_2.visible = false
			botton_panel.visible = true
			cloud_dialogue.visible = true
			label_anthony_3.text = tr("txt_tutorial4")
			label_anthony_3.visible = true
		6:
			label_anthony_3.visible = false
			label_anthony_4.text = tr("txt_tutorial5")
			label_anthony_4.visible = true
			time_progress_bar.visible = true
		7:
			get_parent().get_child(0).get_child(2).create_CombatTuto1()
			get_parent().remove_child($".")
			$".".call_deferred("free")


func _on_texture_button_pressed():
	if_touch_pressed = true
	return if_touch_pressed
