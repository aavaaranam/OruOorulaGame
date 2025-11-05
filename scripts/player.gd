extends CharacterBody2D
@onready var stepDirtSound = $step_dirt
@onready var swordSound = $swordSound
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@export var inventory:Inventory
@onready var inventory_ui: Control = $"../Camera2D/InventoryUI"




var isKolamMode =false



func _input(event):
	if (event.is_action_pressed("MoveRight") 
		or event.is_action_pressed("MoveLeft")
		or event.is_action_pressed("MoveUp")
		or event.is_action_pressed("MoveDown")):
		stepDirtSound.play()
	if (event.is_action_released("MoveRight")
		or event.is_action_released("MoveLeft")
		or event.is_action_released("MoveUp")
		or event.is_action_released("MoveDown")):
		stepDirtSound.stop()
		
	if event.is_action_pressed("Attack"):
		swordSound.play()
	
	
	
	if event.is_action_pressed("light-cracker"):
		animated_sprite_2d.play("oothuvathi")

#func addItemToInventory(invItem:InventoryItem):
	#if invItem in inventory.items:
		#for i in inventory.items:
			#if (invItem == i):
				#i.count +=1
	#else:
		#inventory.items.append(invItem)
	#inventory_ui.update_slots()
