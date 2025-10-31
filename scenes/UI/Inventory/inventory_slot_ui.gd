extends MarginContainer

@onready var item_display: Sprite2D = $NinePatchRect/Panel/CenterContainer/MarginContainer/HBoxContainer/item_display
@onready var label: Label = $NinePatchRect/Panel/CenterContainer/MarginContainer/HBoxContainer/Label

func update(item:InventoryItem):
	if !item:
		item_display.visible = false
	else:
		item_display.visible = true
		item_display.texture = item.texture
		label.text = str(item.count)
