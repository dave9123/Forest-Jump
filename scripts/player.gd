extends CharacterBody2D


const SPEED = 250.0
const JUMP_VELOCITY = -300.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	if is_on_floor():
		if direction != 0:
			$AnimatedSprite2D.play("run_outline")
		else:
			$AnimatedSprite2D.play("idle_outline")
	else:
		if velocity.y > 0:
			$AnimatedSprite2D.play("landing_outline")
		else:
			$AnimatedSprite2D.play("jump_outline")
