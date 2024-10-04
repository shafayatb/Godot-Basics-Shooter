extends Node2D

class_name LevelParent

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")
var item_scene: PackedScene = preload("res://scenes/objects/item.tscn")

func _ready():
	for container in get_tree().get_nodes_in_group('Container'):
		container.connect("open", _on_container_opened)
	
	for container in get_tree().get_nodes_in_group('Scouts'):
		container.connect("laser", _on_scout_laser)	
		
func _on_container_opened(pos, direction):
	var item = item_scene.instantiate()
	item.position = pos
	item.direction = direction
	$Items.add_child.call_deferred(item)

func _on_player_laser(pos, direction):
	_shoot_laser(pos, direction)

func _on_scout_laser(pos, direction):
	_shoot_laser(pos, direction)	
	
func _shoot_laser(pos, direction):
	var laser = laser_scene.instantiate() as Area2D
	laser.position = pos
	laser.rotation_degrees = rad_to_deg(direction.angle()) + 90
	laser.direction = direction
	$Projectiles.add_child(laser)
	
func _on_player_granede(pos, direction):
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity = direction * grenade.speed
	$Projectiles.add_child(grenade)	
