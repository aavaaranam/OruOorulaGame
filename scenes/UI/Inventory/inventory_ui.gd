extends Control

@onready var inventory:Inventory = preload("res://scenes/Inventory/player_inventory.tres")
@onready var slots:Array = $popUpMenu/baseMenuContainer/baseMenuScreen/NinePatchRect/MarginContainer/SlotsContainer.get_children()
var is_open = false

func _ready() -> void:
	update_slots()

func update_slots():
	for i in range(min(inventory.items.size(),slots.size())):
		slots[i].update(inventory.items[i])
