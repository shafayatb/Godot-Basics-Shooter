extends CharacterBody2D

var active: bool = false
var speed: int = 300

func _ready():
	$NavigationAgent2D.target_position = Globals.player_position

func _physics_process(_delta):
	if active:
		look_at(Globals.player_position)
		var next_path_pos = $NavigationAgent2D.get_next_path_position()
		var direction = (next_path_pos - global_position).normalized()
		velocity = direction * speed
		move_and_slide()
	

func _on_notice_area_body_entered(_body):
	active = true


func _on_notice_area_body_exited(_body):
	active = false


func _on_position_timer_timeout():
	if active:
		$NavigationAgent2D.target_position = Globals.player_position
