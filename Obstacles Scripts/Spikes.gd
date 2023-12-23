extends StaticBody2D




func _on_death_area_body_entered(body):
	if body.name == "Player":
		body.HP -= 1
