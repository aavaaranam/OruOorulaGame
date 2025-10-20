extends Area2D

@onready var firework: AnimatedSprite2D = $AnimatedSprite2D

var playerNear = false
#func _ready():
	#firework.play("default")
func _process(delta: float) -> void:
	if not firework.is_playing():
		firework.play("default")

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("light-cracker") and isPlayerNear():
		firework.play("bursting")

func isPlayerNear()->bool:
	return playerNear

#func _on_body_entered(body: Node2D) -> void:
	#print("body entered")
	#if body.is_in_group("player"):
		#playerNear = true


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		playerNear = true
