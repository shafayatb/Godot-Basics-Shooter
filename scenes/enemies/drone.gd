extends CharacterBody2D

var drone_speed: int = 100

func _process(_delta):
	var direction = Vector2.RIGHT
	
	velocity = direction * drone_speed
	
	move_and_slide()
	
func hit():
	print("damage")	
