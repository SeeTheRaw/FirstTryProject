extends Node2D

class_name CheckPoint

var spawn_point = false
var check_point_active = false

func _ready():
	$AnimationPlayer.play("Off")

func activateC():
	Game.current_CheckPoint = self
	check_point_active = true
	$AnimationPlayer.play("Switch")
	$AnimationPlayer.queue("On")

func _on_area_2d_area_entered(area):
	if area.get_parent() is Player && !check_point_active:
		activateC()
