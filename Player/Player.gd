extends CharacterBody2D

var HP = 1
var SPEED = 300.0
var JUMP_VELOCITY = -485.0


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var anim = get_node("AnimationPlayer")
		
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		anim.play("Jump")
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if HP == 1:
		print(direction)
		if direction == -1 :
			get_node("AnimatedSprite2D").flip_h = true
		elif direction == 1 :
			get_node("AnimatedSprite2D").flip_h = false
		if direction: 
			velocity.x = direction * SPEED
			if velocity.y == 0:
				anim.play("Moving")
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			if velocity.y == 0:
				anim.play("Idle")
		if velocity.y > 0:
			anim.play("Fall") 
	
	move_and_slide()
	
	if HP <= 0:
		velocity.x = 0
		velocity.y = 0
		JUMP_VELOCITY = 0
		gravity = 0
		anim.play("Death")
		await anim.animation_finished
		queue_free()
		get_tree().change_scene_to_file("res://main.tscn")
