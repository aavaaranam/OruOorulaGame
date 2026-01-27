extends State
class_name PlayerCycling

@export var movespeed := int(100)
#@export var dash_max := int(500)
#var dashspeed := float(100)
#var can_dash := bool(false)
#var dash_direction := Vector2(0,0)

@onready var animatedSprite = $"../../AnimatedSprite2D"
@onready var stepDirtSound = $"../../step_dirt"

var player : CharacterBody2D 
@export var animator : AnimationPlayer

func enter():
	player = get_parent().get_parent()
	animatedSprite.play("on_cycle")
	#stepDirtSound.play()

func update(delta : float):
	var input_dir = Input.get_vector("MoveLeft", "MoveRight", "MoveUp", "MoveDown").normalized()
	move(input_dir)

func move(input_dir : Vector2):
	player.velocity = input_dir * movespeed 
	player.move_and_slide()
	_update_animations(player.get_position_delta())

#We cannot allow a transition before the dash is complete and the animation has stopped playing
func Transition(newstate : String):
	#if(dashspeed <= 0):
		state_transition.emit(self, newstate)

func _update_animations(movement:Vector2):
	animatedSprite.play("on_cycle")
