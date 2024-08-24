extends Node2D

var speed: int = 500

func _process(delta):
	#input
	var direction = Input.get_vector("left", "right", "up", "down")
	position += direction * speed * delta
	
	#laser
	if Input.is_action_pressed("primary action"):
		print_rich("Lasr shot")
	
	if Input.is_action_pressed("secondary action"):
		print_rich("grande thrown")	
