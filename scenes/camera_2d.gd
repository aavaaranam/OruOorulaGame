extends Camera2D
#@onready var animated_sprite_2d: AnimatedSprite2D = $"../AnimatedSprite2D"
#
#@export var randomStrength:float = 3.0
#@export var shakeFade:float = 0.5
#
#var rng = RandomNumberGenerator.new()
#var isCrackerBursting = false
#var shake_strength:float =0.0
#
#
#func apply_shake():
	#shake_strength = randomStrength
#
#func randomOffset()->Vector2:
	#return Vector2(rng.randf_range(-shake_strength,shake_strength),rng.randf_range(-shake_strength,shake_strength))
#
#func _process(delta: float) -> void:
	#if isCrackerBursting:
		#apply_shake()
		#if shake_strength >0:
			#shake_strength = lerpf(shake_strength,0,shakeFade*RandomNumberGenerator.new().randf())
			#offset = randomOffset()
			##isCrackerBursting = false
#
#
#func _on_atom_bomb_firework_bursting() -> void:
	#isCrackerBursting = true
	#animated_sprite_2d.play("shock")
#
#
#func _on_atom_bomb_fireworkfinished() -> void:
	#isCrackerBursting = false
# A variable to store the tween, so we can check if one is already running
var tween: Tween = null

func move_to_target(new_target_pos: Vector2, duration: float = 1.0) -> void:
	# Kill any existing tween to prevent conflicting animations
	if tween != null:
		tween.kill()
# Create a new tween. The Camera2D itself holds a reference to its own tweens.
	tween = create_tween()
	
	# Tween the camera's global_position property to the new target
	tween.tween_property(self, "global_position", new_target_pos, 1.7)\
		.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if (body.is_in_group("player")):
		var new_pos:Vector2 
		new_pos.x = body.global_position.x+100
		new_pos.y = body.global_position.y+100
		move_to_target( new_pos)
