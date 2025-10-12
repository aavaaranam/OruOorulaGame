extends Area2D

@onready var jasmine_plant: AnimatedSprite2D = $JasminePlant

var playerNear = false

func _process(delta: float) -> void:
	jasmine_plant.play("picking")

#func _input(event: InputEvent) -> void:
	#if event.is_action_pressed("Attack") and playerNear:
		#jasmine_plant.play("idle")

func _on_body_entered(body: Node2D) -> void:
	print("body entered")
	jasmine_plant.play("idle")
	if body.is_in_group("player"):
		playerNear = true
