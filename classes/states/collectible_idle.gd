extends State
class_name CollectibleIdle

@onready var animatedSprite = $"../../AnimatedSprite2D"
@onready var jasmine: Area2D = $"../../../Jasmine"

func enter():
	animatedSprite.play("idle")

func update(_delta : float):
	if Input.is_action_just_pressed("Attack"):
		if jasmine.isPlayerNear():
			animatedSprite.play("picking")
