extends Node2D


var isKolamMode = false
var pos:Vector2
@export var texture : Texture2D
var points:Array[Vector2]=[]
func _draw():
	if texture == null:
		return

	var offset = Vector2(texture.get_width(), texture.get_height()) * 0.5

	for p in points:
		p.x = p.x+(offset.x*5+3)
		p.y = p.y-(offset.y)
		draw_texture(texture, p)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Kolam"):
		isKolamMode = true
	if event.is_action_pressed("Attack") and isKolamMode:
		points.append(event.position)
		queue_redraw()
