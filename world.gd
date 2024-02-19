extends Node2D

func _ready():
	Engine.max_fps = 60
	
func _enter_tree():
	if Checkpoint.last_position:
		$Player.global_position = Checkpoint.last_position

