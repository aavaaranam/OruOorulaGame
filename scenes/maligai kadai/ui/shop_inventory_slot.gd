extends MarginContainer
@export var item:Item
@onready var label: Label = $MarginContainer/NinePatchRect/HBoxContainer/Panel2/MarginContainer/Label
@onready var sprite_2d: Sprite2D = $MarginContainer/NinePatchRect/HBoxContainer/Panel/Sprite2D

func _ready() -> void:
	label.text = item.name
	sprite_2d.texture = item.texture
