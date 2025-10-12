extends Area2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var playerNear = false
func _process(delta: float) -> void:
	animated_sprite_2d.play("idle")

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Attack") and playerNear:
		animated_sprite_2d.play("picked")

#func _on_body_entered(body: Node2D) -> void:
	#if (body.is_in_group("player")):
		#playerNear = true
