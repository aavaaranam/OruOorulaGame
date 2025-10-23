extends Area2D
signal coconutFalling
signal fireworkfinished
@onready var thennamaram: AnimatedSprite2D = $AnimatedSprite2D
@onready var playerSprite: AnimatedSprite2D = $"../Player/AnimatedSprite2D"


var is_rotating = false
var tween: Tween
var playerNear = false
var isFallen = false
var isRolled =  false
var attackCount = 0
func _ready():
	thennamaram.play("default")

func _process(delta: float) -> void:
	if not thennamaram.is_playing() and isFallen:
		thennamaram.play("fell-down")

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Attack") and isPlayerNear():
		if attackCount<4:
			thennamaram.play("shaking")
			attackCount+=1
		else:
			thennamaram.play("falling")
			isFallen = true
			#playerSprite.play("shock")
			coconutFalling.emit()
		#if firework.frame == 13:
			#fireworkBursting.emit()
		#thennamaram.animation_finished.connect(fireworkfinished.emit)
		

func isPlayerNear()->bool:
	return playerNear

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		self.playerNear = true
