extends Control
@onready var audio: AudioStreamPlayer = $ButtonSound

# Called when the node enters the scene tree for the first time.
# Llamado cuando el nodo entra en el árbol de la escena por primera vez.
func _ready():
	# Reproduce la música de opciones del menú. Asume que hay un nodo de audio llamado 'MusicaMenuOpciones'.
	ControlMusica.play_music = true
# Función que se llama cuando el valor del control maestro cambia.
func _on_master_value_changed(value):
	# Ajusta el volumen del bus maestro (índice 0) al valor proporcionado.
	volume(0, value)
	
# Función para ajustar el volumen de un bus de audio específico.
func volume(bus_index, value):
	# Establece el volumen del bus de audio especificado por 'bus_index' al valor proporcionado.
	AudioServer.set_bus_volume_db(bus_index, value)
	
# Función que se llama cuando el valor del control de música cambia.
func _on_music_value_changed(value):
	# Ajusta el volumen del bus de música (índice 1) al valor proporcionado.
	volume(1, value)

# Función que se llama cuando el valor del control de efectos de sonido cambia.
func _on_sound_fx_value_changed(value):
	# Ajusta el volumen del bus de efectos de sonido (índice 2) al valor proporcionado.
	volume(2, value)

# Función que se llama cuando el botón de pantalla completa es alternado.
func _on_full_screen_toggled(toggled_on):
	if toggled_on:
		# Cambia el modo de la ventana a pantalla completa si está activado.
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN) 
	else:
		# Cambia el modo de la ventana a modo ventana si está desactivado.
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

# Función que se llama cuando el botón de pantalla sin bordes es alternado.
func _on_borderless_toggled(toggled_on):
	# Establece o elimina la bandera de ventana sin bordes según el estado de 'toggled_on'.
	DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, toggled_on)

# Función que se llama cuando una opción de sincronización vertical es seleccionada.
func _on_v_sync_item_selected(index):
	# Establece el modo de VSync según el índice seleccionado.
	DisplayServer.window_set_vsync_mode(index)

# Función que se llama cuando se presiona el botón de regresar.
func _on_button_pressed():
	# Cambia la escena actual a 'MenuPrincipal.tscn'.
	audio.play()
	get_tree().change_scene_to_file("res://Assets/Scenes/MenuPrincipal/MenuPrincipal.tscn")

