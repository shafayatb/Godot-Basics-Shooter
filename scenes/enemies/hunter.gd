extends CharacterBody2D

var active: bool = false
var speed: int = 300

func _ready():
	$NavigationAgent2D.path_desired_distance = 4.0
	$NavigationAgent2D.target_desired_distance = 4.0
	$NavigationAgent2D.target_position = Globals.player_position

func _physics_process(_delta):
	if active:
		var next_path_pos = $NavigationAgent2D.get_next_path_position()
		var direction = (next_path_pos - global_position).normalized()
		velocity = direction * speed
		move_and_slide()
		var look_angle = direction.angle()
		rotation = look_angle + PI/2
	

func _on_notice_area_body_entered(_body):
	active = true
	$AnimationPlayer.play("walk")


func _on_notice_area_body_exited(_body):
	active = false
	$AnimationPlayer.stop()


func _on_position_timer_timeout():
	if active:
		$NavigationAgent2D.target_position = Globals.player_position


func _on_attack_area_body_entered(body):
	pass # Replace with function body.


func _on_attack_area_body_exited(body):
	pass # Replace with function body.
