extends CharacterBody2D

var SPEED = 200
var player
var notice = false
var chase = false

func _ready():
	get_node("AnimatedSprite2D").play("Idle")




#Area2D code

func _on_player_notice_body_entered(body):
	if body.name == "Player":
		notice = true
func _on_player_notice_body_exited(body):
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
		SPEED = 0
		notice = false
		chase = false
		body.HP -= 1
	
