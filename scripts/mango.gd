extends RigidBody2D

@onready var player: CharacterBody2D = $"../../Player"
@onready var mangoItem =  preload("res://scenes/Inventory/items/mango.tres")

func _on_body_entered(body: Node2D) -> void:
	if (body.is_in_group("player")):
		body.addItemToInventory(mangoItem)
		queue_free()
