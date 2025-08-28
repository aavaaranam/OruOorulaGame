extends Path2D
# In the player's script, attached to the PathFollow node
@export var speed:float = 0.003
@onready var path_follow:PathFollow2D = $PathFollow2D
@onready var anim:AnimationPlayer = $AnimationPlayer

var last_position:Vector2

func _ready():
	last_position = path_follow.position


func _physics_process(delta):
	path_follow.progress_ratio += delta * speed*6
	
	var movement := path_follow.position - last_position
	if(movement.length()>0.05):
		_update_animations(movement)
	last_position = path_follow.position 
	
func _update_animations(movement:Vector2):
	var anim_name := 'walk_'
	anim_name +=(
		"right" if abs(movement.x)>abs(movement.y) and movement.x>0 
		else "left" if abs(movement.x)>abs(movement.y)
		else "down" if abs(movement.y)>abs(movement.x) and movement.y>0 
		else "up" 
	)
	
	if anim.current_animation != anim_name:
		anim.play(anim_name)
