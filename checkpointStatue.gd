extends Area2D


func _ready():
	$AnimationPlayer.play("off")

var touchC = true

func _on_body_entered(body):
	if body.name == "Player":
		Checkpoint.check_point_active = true
		Checkpoint.last_position = global_position - Vector2(850,0)
		if touchC == true :
			$AnimationPlayer.play("switch")
			$AnimationPlayer.queue("on")
			touchC = false
