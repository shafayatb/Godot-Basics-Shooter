extends CharacterBody2D

var speed: int = 500

func _process(_delta):
	#input
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed 
	
	#laser
	if Input.is_action_pressed("primary action"):
		print_rich("Lasr shot")
	
	if Input.is_action_pressed("secondary action"):
		print_rich("grande thrown")	
		
	move_and_slide()
