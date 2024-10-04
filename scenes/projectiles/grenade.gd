extends RigidBody2D

const speed: int = 750
const hit_radius := 400

var is_exploding := false

func explode():
	$AnimationPlayer.play("Explosion")
	is_exploding = true
	
func _process(_delta):
	if is_exploding:
		var targets =  get_tree().get_nodes_in_group("Entity")
		for target in targets:
			var in_range = target.global_position.distance_to(global_position) < hit_radius
			if "hit" in target and in_range:
				target.hit()
