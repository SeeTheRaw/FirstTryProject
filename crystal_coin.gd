extends Area2D

func _ready():
	get_node("AnimatedSprite2D").play("Default")

func _on_body_entered(body):
	if body.name == "Player":
		Game.Coins += 1
		get_node("AnimatedSprite2D").play("PickedUP")
		var tween = get_tree().create_tween()
		tween.tween_property(self, "position", position - Vector2(0,25), 0.3)
		tween.tween_callback(queue_free)
