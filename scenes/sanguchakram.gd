extends Area2D

@onready var firework: AnimatedSprite2D = $AnimatedSprite2D
@export var rotation_curve: Curve # Create a Curve resource here
@export var rotation_duration: float = 9.0 # The duration of the rotation in seconds
@export var rotation_angle: float = 360.0*30# Total angle to rotate

var is_rotating = false
var tween: Tween
var playerNear = false
var isBurst = false
func _ready():
	firework.play("default")

func _process(delta: float) -> void:
	if not firework.is_playing() and isBurst:
		firework.play("is_burst")

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("light-cracker") and isPlayerNear():
		firework.play("burstingg")
		start_rotation()
		

func isPlayerNear()->bool:
	return playerNear

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		playerNear = true

func start_rotation():
	# If a tween is already running, kill it before creating a new one
	if tween and tween.is_valid():
		tween.kill()
	is_rotating = true
	var start_rotation = rotation
	var target_rotation = start_rotation + deg_to_rad(rotation_angle)

	tween = create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_SINE)

	tween.tween_method(
		func(value): 
			rotation = start_rotation + (target_rotation - start_rotation) * rotation_curve.sample(value),
		0.0, 1.0, rotation_duration
	)

	# Set the animation to finish
	tween.finished.connect((func():is_rotating = false))
	isBurst = true
