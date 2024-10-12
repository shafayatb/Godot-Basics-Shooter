extends PathFollow2D

var player_entered: bool = false

@onready var line_ray1: Line2D = $Turrent/RayCast2D/Line2D
@onready var line_ray2: Line2D = $Turrent/RayCast2D2/Line2D

func fire():
	Globals.health -= 20

func _ready():
	line_ray1.add_point($Turrent/RayCast2D.target_position)
	line_ray2.add_point($Turrent/RayCast2D2.target_position)

func _process(delta):
	progress_ratio += 0.03 * delta
	if player_entered:
		$Turrent.look_at(Globals.player_position)


func _on_notice_area_body_entered(_body):
	player_entered = true
	$AnimationPlayer.play("shoot_laser")


func _on_notice_area_body_exited(_body):
	player_entered = false
	$AnimationPlayer.pause()
	var tween = create_tween()
	tween.set_parallel(true)
	tween.tween_property(line_ray1, "width", 0, randf_range(0.1,0.5))
	tween.tween_property(line_ray2, "width", 0, randf_range(0.1,0.5))
	await tween.finished
	$AnimationPlayer.stop()
	
