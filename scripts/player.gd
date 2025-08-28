extends CharacterBody2D
@onready var stepDirtSound = $step_dirt
@onready var swordSound = $swordSound
#func _physics_process(delta: float) -> void:
	#if Input.is_action_pressed("MoveRight"):
			#if stepDirtSound.playing == false:
				#stepDirtSound.play()
			#else:
				#stepDirtSound.stop()
				
func _input(event):
	if (event.is_action_pressed("MoveRight") 
		or event.is_action_pressed("MoveLeft")
		or event.is_action_pressed("MoveUp")
		or event.is_action_pressed("MoveDown")):
		stepDirtSound.play()
	if (event.is_action_released("MoveRight")
		or event.is_action_released("MoveLeft")
		or event.is_action_released("MoveUp")
		or event.is_action_released("MoveDown")):
		stepDirtSound.stop()
		
	if event.is_action_pressed("Attack"):
		swordSound.play()
