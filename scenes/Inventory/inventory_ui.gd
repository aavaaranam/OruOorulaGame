extends Control
@onready var inventory:Inventory = preload("res://scenes/Inventory/player_inventory.tres")
@onready var slots:Array = $NinePatchRect/GridContainer.get_children()
var is_open = false

func _ready() -> void:
	update_slots()

func _process(delta: float) -> void:
	if(Input.is_action_just_pressed("open_Inv")):
		if is_open:
			close()
		else:
			update_slots()
			open()
		

func update_slots():
	for i in range(min(inventory.items.size(),slots.size())):
		slots[i].update(inventory.items[i])

func close():
	visible = false
	is_open = false

func open():
	visible = true
	is_open = true
