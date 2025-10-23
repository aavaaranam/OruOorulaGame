extends State
class_name PlayerIdle

@onready var animatedSprite = $"../../AnimatedSprite2D"
@onready var stepDirtSound = $"../../step_dirt"
func enter():
	animatedSprite.stop()
	
func update(_delta : float):
	if(Input.get_vector("MoveLeft", "MoveRight", "MoveUp", "MoveDown").normalized()):
		state_transition.emit(self, "Moving")
		#stepDirtSound.play()
		
	if Input.is_action_just_pressed("Attack"):
		state_transition.emit(self, "Attacking")


func _on_thenna_maram_coconut_falling() -> void:
	state_transition.emit(self,"Shock")
