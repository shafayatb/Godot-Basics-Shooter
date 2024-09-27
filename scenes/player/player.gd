extends CharacterBody2D

var can_laser: bool = true
var can_grenade: bool = true

@export var max_speed: int = 500
var speed: int = max_speed

signal laser(position, direction)
signal granede(position, direction)

func _process(_delta):
	#input
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed 
	
	look_at(get_global_mouse_position())
	var player_direction = (get_global_mouse_position() - position).normalized()
	#laser
	if Input.is_action_pressed("primary action") and can_laser and Globals.laser_amount > 0:
		Globals.laser_amount -= 1
		$LaserParticle.emitting = true
		can_laser = false
		$LaserTimer.start(0.5)
		laser.emit(get_marker_position(), player_direction)
		
	
	if Input.is_action_pressed("secondary action") and can_grenade and Globals.grenade_amount > 0:
		Globals.grenade_amount -= 1
		can_grenade= false
		$GrenadeTimer.start(2.0)
		granede.emit(get_marker_position(), player_direction)
		
	move_and_slide()
	

func _on_laser_timer_timeout():
	can_laser = true


func _on_grenade_timer_timeout():
	can_grenade = true
	
func get_marker_position() -> Vector2:
	var laser_markers = $LaserStartPositions.get_children()
	var selected_laser = laser_markers[randi() % laser_markers.size()]
	return selected_laser.global_position
