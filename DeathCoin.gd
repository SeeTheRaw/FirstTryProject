extends Area2D


func _ready():
	get_node("AnimatedSprite2D").play("default")

func _on_body_entered(body):
	if body.name == "Player":
		body.HP -= 1
		get_node("AnimatedSprite2D").play("pickedUP")
		await get_node("AnimatedSprite2D").animation_finished
		get_node("AnimatedSprite2D").play("default")
