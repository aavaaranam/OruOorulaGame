extends Control



func _ready() -> void:
	visible = true

func toggleVisibility():
	if visible:visible = false
	else:visible = true
	
