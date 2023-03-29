extends KinematicBody2D

var velocity = Vector2.ZERO
var fast_fell = false

func _physics_process(delta: float) -> void:

@@ -14,11 +15,20 @@ func _physics_process(delta: float) -> void:
		apply_acceleration(input.x)

	# player jump
	if Input.is_action_just_pressed("ui_up"):
		velocity.y = -100
	if is_on_floor():
		fast_fell = false
		if Input.is_action_just_pressed("ui_up"):
			velocity.y = -130
	else:
		if Input.is_action_just_released("ui_up") and velocity.y < -70:
			velocity.y = -70

		if velocity.y > 0 and not fast_fell:
			velocity.y += 40
			fast_fell = true

	# apply movement to the player
	velocity = move_and_slide(velocity)
	velocity = move_and_slide(velocity, Vector2.UP)

func apply_gravity():
	# gravity
