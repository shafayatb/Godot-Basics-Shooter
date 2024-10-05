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
		
var player_vunerable := true		
var health: int = 60:
	set(value):
		if value > health:
			health = min(value, 100)
		else:	
			if player_vunerable:
				health = value	
				player_vunerable = false
				player_invulnerable_timer()
		stat_change.emit()

func player_invulnerable_timer():
	await get_tree()	.create_timer(0.5).timeout
	player_vunerable = true

var player_position: Vector2	
