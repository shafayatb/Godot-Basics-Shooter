extends CharacterBody2D

var active: bool = false
var health := 50
var will_take_damage := true
var drone_speed: int = 400

func _ready():
	$Explosion.hide()
	$Drone.show()

func _process(delta):
	if active:
		look_at(Globals.player_position)
		var direction = (Globals.player_position - position).normalized()
		velocity = direction * drone_speed * delta
		var collision = move_and_collide(velocity)
		if collision:
			kill_drone()
	
func hit():
	if will_take_damage:
		health -= 10
		will_take_damage = false
		$HitTimer.start()
		$Drone.material.set_shader_parameter("progress", 1)
	if health <=0:
		kill_drone()

func kill_drone():
	drone_speed = 0
	active = false
	$AnimationPlayer.play("explosion")

func _on_area_2d_body_entered(_body):
	active = true


func _on_hit_timer_timeout():
	will_take_damage = true
	$Drone.material.set_shader_parameter("progress", 0)
