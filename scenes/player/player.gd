extends CharacterBody2D

var speed: int = 500
var can_laser: bool = true
var can_grenade: bool = true

signal laser(position)
signal granede(position)

func _process(_delta):
	#input
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed 
	
	#laser
	if Input.is_action_pressed("primary action") and can_laser:
		print_rich("Lasr shot")
		can_laser = false
		$LaserTimer.start(0.5)
		laser.emit(get_marker_position())
		
	
	if Input.is_action_pressed("secondary action") and can_grenade:
		print_rich("grande thrown")	
		can_grenade= false
		$GrenadeTimer.start(2.0)
		granede.emit(get_marker_position())
		
	move_and_slide()
	

func _on_laser_timer_timeout():
	can_laser = true


func _on_grenade_timer_timeout():
	can_grenade = true
	
func get_marker_position() -> Vector2:
	var laser_markers = $LaserStartPositions.get_children()
	var selected_laser = laser_markers[randi() % laser_markers.size()]
	return selected_laser.global_position
