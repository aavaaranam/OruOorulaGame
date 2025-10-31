extends Area2D
@onready var player: CharacterBody2D = $"../Player"
@onready var shop_inventory: Control = $ShopInventory

var isPlayerNear = false
@onready var dialogue = load("res://dialogue/main.dialogue")
func _unhandled_input(event: InputEvent) -> void:
	if(event.is_action_pressed("shop") and isPlayerNear):
		shop_inventory.visible = true
		#DialogueManager.show_example_dialogue_balloon(dialogue)

func _on_body_entered(body: Node2D) -> void:
	if (body.is_in_group("player")):
		#body.velocity = Vector2.ZERO
		#body.move_and_slide()
		isPlayerNear = true
