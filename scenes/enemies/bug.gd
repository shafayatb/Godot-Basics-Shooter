extends CharacterBody2D

var player_entered: bool = false
var player_can_take_damage = false
var can_attack: bool = true
var health := 50
var will_take_damage := true
var bug_speed: int = 300

func hit():
	if will_take_damage:
		health -= 10
		will_take_damage = false
		$Timers/HitTimer.start()
		$AnimatedSprite2D.material.set_shader_parameter("progress", 1)
		$Particles/HitParticles.emitting = true
	if health <=0:
		await  get_tree().create_timer(0.5).timeout
		queue_free()
			
func _process(_delta):
	look_at(Globals.player_position)
	if player_can_take_damage:
		if can_attack:
			$AnimatedSprite2D.play("attack")
			await $AnimatedSprite2D.animation_finished
			$AnimatedSprite2D.stop()	
			can_attack = false
			$Timers/AttackTimer.start()
	elif player_entered:
		var direction = (Globals.player_position - position).normalized()
		velocity = direction * bug_speed
		move_and_slide()
		$AnimatedSprite2D.play("walk")

func _on_notice_area_body_entered(_body):
	player_entered = true


func _on_notice_area_body_exited(_body):
	player_entered = false
	$AnimatedSprite2D.stop()


func _on_attack_area_body_entered(_body):
	player_can_take_damage = true


func _on_attack_area_body_exited(_body):
	player_can_take_damage = false


func _on_attack_timer_timeout():
	can_attack = true


func _on_hit_timer_timeout():
	will_take_damage = true
	$AnimatedSprite2D.material.set_shader_parameter("progress", 0)


func _on_animated_sprite_2d_animation_finished():
	if player_entered:
		Globals.health -= 10
