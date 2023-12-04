extends CharacterBody2D

var SPEED = 450
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var player
var notice = false
var chase = false
func _ready():
	get_node("AnimatedSprite2D").play("Idle")
	
#gravity for enemy
func _physics_process(delta):
	velocity.y += gravity * delta
	if notice == true:
		get_node("AnimatedSprite2D").play("Notice")
		player = get_node("../../Player/Player")
		var direction = (player.position - self.position).normalized()
		if direction.x > 0:
			get_node("AnimatedSprite2D").flip_h = true
			
		else: 
			get_node("AnimatedSprite2D").flip_h = false
			
	else:
		get_node("AnimatedSprite2D").play("Idle")
		get_node("AnimatedSprite2D").flip_h = false
		velocity.x = 0 
	move_and_slide()
	
	if chase == true:
		get_node("AnimatedSprite2D").play("Attack")
		player = get_node("../../Player/Player")
		var direction = (player.position - self.position).normalized()

		if direction.x > 0:
			get_node("AnimatedSprite2D").flip_h = true
			velocity.x = direction.x * SPEED
		else: 
			get_node("AnimatedSprite2D").flip_h = false
			velocity.x = direction.x * SPEED
	else:
		velocity.x = 0 
		
func _on_player_detection_body_entered(body):
	if body.name == "Player":
		notice = true
		
func _on_player_detection_body_exited(body):
	if body.name == "Player":
		notice = false

func _on_player_chase_body_entered(body):
	if body.name == "Player":
		chase = true

func _on_player_chase_body_exited(body):
	if body.name == "Player":
		chase = false


func _on_player_death_body_entered(body):
	if body.name == "Player":
		notice = false
		chase = false
		velocity.x = 0
		body.HP -= 1
	
	
