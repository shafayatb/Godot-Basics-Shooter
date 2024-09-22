extends Area2D

@export var speed: int = 1000
var direction: Vector2 = Vector2.UP

func _ready():
	$SelfDestructTimer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += direction * speed * delta


func _on_body_entered(body):
	if "hit" in body:
		body.hit()
	queue_free()


func _on_laser_timer_timeout():
	print("kill laser")
	queue_free()
