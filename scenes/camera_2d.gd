extends Camera2D
@onready var animated_sprite_2d: AnimatedSprite2D = $"../AnimatedSprite2D"

@export var randomStrength:float = 3.0
@export var shakeFade:float = 0.5

var rng = RandomNumberGenerator.new()
var isCrackerBursting = false
var shake_strength:float =0.0


func apply_shake():
	shake_strength = randomStrength

func randomOffset()->Vector2:
	return Vector2(rng.randf_range(-shake_strength,shake_strength),rng.randf_range(-shake_strength,shake_strength))

func _process(delta: float) -> void:
	if isCrackerBursting:
		apply_shake()
		if shake_strength >0:
			shake_strength = lerpf(shake_strength,0,shakeFade*RandomNumberGenerator.new().randf())
			offset = randomOffset()
			#isCrackerBursting = false


func _on_atom_bomb_firework_bursting() -> void:
	isCrackerBursting = true
	animated_sprite_2d.play("shock")


func _on_atom_bomb_fireworkfinished() -> void:
	isCrackerBursting = false
