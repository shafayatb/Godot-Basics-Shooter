extends Node2D

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")

func _on_gate_player_entered_gate(body):
	print("Player has entered gate")
	print(body)

func _on_player_laser(pos, direction):
	var laser = laser_scene.instantiate()
	laser.position = pos
	$Projectiles.add_child(laser)
	
func _on_player_granede(pos, direction):
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity = direction * grenade.speed
	$Projectiles.add_child(grenade)	
