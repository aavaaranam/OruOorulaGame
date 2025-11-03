extends CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var fly_speed =3
var direction = Vector2.ZERO
var arrayOfFuncs = [fly_right,fly_left]
var is_flying = false
var fly_direction

func _physics_process(delta):
	#var direction = Vector2.ZERO
	if Input.is_action_pressed("light-cracker"):
		is_flying = true
		fly_direction = arrayOfFuncs[randi_range(0, 1)]
		fly_direction.call()
		velocity = direction * fly_speed
		move_and_slide()
	if is_flying:
		velocity = direction * fly_speed
		position += direction * fly_speed * delta
		move_and_slide()

func fly_right():
	direction.x += 2
	direction.y -= 2
	animated_sprite_2d.play("fly_right")
func fly_left():
	direction.x -= 2
	direction.y -= 2
	animated_sprite_2d.play("fly_left")
