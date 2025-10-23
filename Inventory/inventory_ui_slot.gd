extends Panel

@onready var item_display: Sprite2D = $CenterContainer/Panel/item_display
@onready var label: Label = $CenterContainer/Panel/Label

func update(item:InventoryItem):
	if !item:
		item_display.visible = false
	else:
		item_display.visible = true
		item_display.texture = item.texture
		label.text = str(item.count)
		
