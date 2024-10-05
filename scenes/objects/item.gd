extends Area2D

var rotation_speed: int = 4
var item_options: Array[String] = ['laser','laser','laser','laser', 'grenade', 'grenade', 'grenade', 'health','health']
var type: String = 'health'

var direction: Vector2
var distance: int = randi_range(150, 250)

func _ready():
	print(type)
	if type == 'laser':
		$Sprite2D.modulate = Color(0.208, 0.623, 0.919)
	elif type == 'grenade':
		$Sprite2D.modulate = Color(1, 0.327, 0.236)	
	elif type == 'health':
		$Sprite2D.modulate = Color(0, 0.72, 0.075)	
	
	var target_pos = position + direction * distance	
	var tween = create_tween()
	tween.set_parallel(true)
	tween.tween_property(self, "position", target_pos, 0.5)
	tween.tween_property(self, "scale", Vector2(1,1), 0.5).from(Vector2(0,0))

func _process(delta):
	rotation += rotation_speed * delta


func _on_body_entered(_body):
	match type:
		"laser":
			Globals.laser_amount += 10
		"grenade":
			Globals.grenade_amount += 3
		"health":
			Globals.health += 10	
	queue_free()
