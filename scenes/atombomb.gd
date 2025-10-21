extends Area2D
signal fireworkBursting
signal fireworkfinished
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
		firework.play("lighting")
		fireworkBursting.emit()
		firework.play("bursting")
		#if firework.frame == 13:
			#fireworkBursting.emit()
		firework.animation_finished.connect(fireworkfinished.emit)
		

func isPlayerNear()->bool:
	return playerNear

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		self.playerNear = true
