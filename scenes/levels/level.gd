extends Node2D

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")

func _on_gate_player_entered_gate(body):
	print("Player has entered gate")
	print(body)


func _on_player_granede():
	print("grenade emitted")


func _on_player_laser(pos):
	print("laser emitted")
	var laser = laser_scene.instantiate()
	laser.position = pos
	$Projectiles.add_child(laser)
