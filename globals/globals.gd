extends Node

signal  increase_health

var laser_amount := 50
var grenade_amount := 10
var health: int = 60:
	get:
		return health
	set(value):
		health = value	
		increase_health.emit()
