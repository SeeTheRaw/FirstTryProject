extends Node

var player : Player
var PlayerHP = 1
var Coins = 0

var current_CheckPoint : CheckPoint

func respawn_Player():
	player.HP = 1
	player.gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
	player.JUMP_VELOCITY = -485.0
	if current_CheckPoint != null :
		player.position = current_CheckPoint.global_position
	else:
		player.position = player.global_position
		get_tree().reload_current_scene()
