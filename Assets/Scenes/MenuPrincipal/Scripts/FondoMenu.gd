extends Sprite2D

func _ready():
	# Obtener el tamaño de la pantalla
	var screen_size = get_viewport().size
	
	# Obtener el tamaño de la textura
	var texture_size = texture.get_size()
	
	# Calcular la escala necesaria para que la textura cubra toda la pantalla
	var scale_x = screen_size.x / texture_size.x
	var scale_y = screen_size.y / texture_size.y
	
	# Establecer la escala
	scale = Vector2(scale_x, scale_y)
