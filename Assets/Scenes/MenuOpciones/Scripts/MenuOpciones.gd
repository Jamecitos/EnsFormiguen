extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$MusicaMenuOpciones.play()





func _on_master_value_changed(value):
	volume(0,value)
	
func volume(bus_index,value):
	AudioServer.set_bus_volume_db(bus_index,value)
	

func _on_music_value_changed(value):
	volume(1,value)


func _on_sound_fx_value_changed(value):
	volume(2,value)


func _on_full_screen_toggled(toggled_on):
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN) 
	else :
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)


func _on_borderless_toggled(toggled_on):
	DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, toggled_on)


func _on_v_sync_item_selected(index):
	DisplayServer.window_set_vsync_mode(index)


func _on_button_pressed():
	get_tree().change_scene_to_file("res://MenuPrincipal.tscn")
