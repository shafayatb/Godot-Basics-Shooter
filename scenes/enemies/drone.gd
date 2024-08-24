extends CharacterBody2D

var drone_speed: int = 400

func _process(delta):
	var direction = Vector2.RIGHT
	
	velocity = direction * drone_speed
	
	move_and_slide()
