extends Node2D
#
#var isKolamMode =false
#
#func _input(event: InputEvent) -> void:
	#if event.is_action_pressed("Kolam"):
		#isKolamMode = true
	#if event.is_action_pressed("Attack") and isKolamMode:
		#place_sprite_at_mouse_position(event.position)
#
#func place_sprite_at_mouse_position(mouse_pos: Vector2):
	#var new_sprite = Sprite2D.new()
	#new_sprite.texture = load("res://assets/sprites/kolam/pulli.png") # Replace with your texture path
	#new_sprite.global_position = mouse_pos
	#add_child(new_sprite)
