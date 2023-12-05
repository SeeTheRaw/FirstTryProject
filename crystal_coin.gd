extends Area2D

func _ready():
	get_node("AnimatedSprite2D").play("Default")

func _on_body_entered(body):
	if body.name == "Player":
		Game.Coins += 1
		queue_free()
