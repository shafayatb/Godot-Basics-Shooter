extends CharacterBody2D

var player_entered: bool = false
var can_laser: bool = true
var last_position := 0

signal laser(position, direction)

func _process(_delta):
	if player_entered:
		look_at(Globals.player_position)
		if can_laser:
			var pos = get_marker_position()
			var direction = (Globals.player_position - position).normalized()
			laser.emit(pos, direction)
			can_laser = false
			$LaserTimer.start()
		

func get_marker_position() -> Vector2:
	var laser_markers = $LaserShootingPositions.get_children()
	var selected_laser = laser_markers[last_position]
	if last_position == 0:
		last_position = 1
	else: 
		last_position = 0
	return selected_laser.global_position

func _on_attack_area_body_entered(_body):
	player_entered = true


func _on_attack_area_body_exited(_body):
	player_entered = false


func _on_laser_timer_timeout():
	can_laser = true
	
func hit():
	print('took damage')	
