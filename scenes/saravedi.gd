extends Area2D

@onready var firework: AnimatedSprite2D = $AnimatedSprite2D


var is_rotating = false
var tween: Tween
var playerNear = false
var isBurst = false
var isRolled =  false
func _ready():
	firework.play("default")

func _process(delta: float) -> void:
	if not firework.is_playing() and isBurst:
		firework.play("is_burst")

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("light-cracker") and isPlayerNear():
		if not isRolled:
			firework.play("rolling")
			isRolled =true
		else:
			firework.play("bursting")
		

func isPlayerNear()->bool:
	return playerNear

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		self.playerNear = true
