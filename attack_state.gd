extends State
class_name PlayerAttacking

#@export var movespeed := int(35)
#@export var dash_max := int(500)
#var dashspeed := float(100)
#var can_dash := bool(false)
#var dash_direction := Vector2(0,0)

@onready var animatedSprite = $"../../AnimatedSprite2D"
@onready var swordSound = $"../../swordSound"

var player : CharacterBody2D 
@export var animator : AnimationPlayer

func enter():
	player = get_parent().get_parent()
	animatedSprite.play("attack")
	
func update(_delta : float):
	#swordSound.play()
	animatedSprite.play("attack")
	
	if animatedSprite.frame == 4: 
		Transition("idle")

func Transition(newstate : String):
	state_transition.emit(self, newstate)
