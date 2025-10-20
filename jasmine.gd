extends Area2D

@onready var jasmine_plant: AnimatedSprite2D = $AnimatedSprite2D

var playerNear = false

#func _process(delta: float) -> void:
	#jasmine_plant.play("picking")

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Attack") and isPlayerNear():
		jasmine_plant.play("picking")

func isPlayerNear()->bool:
	return playerNear

func _on_body_entered(body: Node2D) -> void:
	#print("body entered")
	#jasmine_plant.play("picking")
	if body.is_in_group("player"):
		playerNear = true
