extends Sprite2D

func _process(delta):
	# Makes the sprite rotate to look at the mouse
	look_at(get_global_mouse_position())
	$".".rotation_degrees += 1
