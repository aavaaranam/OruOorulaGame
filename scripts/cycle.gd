extends Area2D
signal isOnCycle
var playerNear = false

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Attack") and playerNear:
		isOnCycle.emit()
		queue_free()


func _on_body_entered(body: Node2D) -> void:
	if (body.is_in_group("player")):
		playerNear = true
		
		


func _on_is_on_cycle() -> void:
	pass # Replace with function body.
