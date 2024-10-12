extends CharacterBody2D

var active: bool = false
var health := 50
var will_take_damage := true
var max_drone_speed: int = 400
var drone_speed: int = 0
var explosion_active: bool = false

func _ready():
	$Explosion.hide()
	$DroneSprite.show()

func _process(delta):
	if active:
		look_at(Globals.player_position)
		var direction = (Globals.player_position - position).normalized()
		velocity = direction * drone_speed * delta
		var collision = move_and_collide(velocity)
		if collision:
			print(collision)
			kill_drone()
	if explosion_active:
		damage_surroundings()		
	
func hit():
	if will_take_damage:
		health -= 10
		will_take_damage = false
		$HitTimer.start()
		$DroneSprite.material.set_shader_parameter("progress", 1)
	if health <=0:
		kill_drone()

func kill_drone():
	drone_speed = 0
	active = false
	$AnimationPlayer.play("explosion")
	explosion_active = true
	
func damage_surroundings():
	var targets =  get_tree().get_nodes_in_group("Entity")
	for target in targets:
		var in_range = target.global_position.distance_to(global_position) < 400
		if "hit" in target and in_range:
			target.hit()

func _on_area_2d_body_entered(_body):
	active = true
	var tween = get_tree().create_tween()
	tween.tween_property(self, "drone_speed", max_drone_speed, 5)


func _on_hit_timer_timeout():
	will_take_damage = true
	$DroneSprite.material.set_shader_parameter("progress", 0)
