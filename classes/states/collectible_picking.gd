extends State
class_name CollectiblePicking

@onready var animatedSprite = $"../../AnimatedSprite2D"

func enter():
	animatedSprite.play("picking")
