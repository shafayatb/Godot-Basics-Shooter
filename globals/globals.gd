extends Node

signal stat_change

var laser_amount := 50:
	set(value):
		laser_amount = value	
		stat_change.emit()
		
var grenade_amount := 10:
	set(value):
		grenade_amount = value	
		stat_change.emit()
		
var health: int = 60:
	set(value):
		health = value	
		stat_change.emit()

var player_position: Vector2		
