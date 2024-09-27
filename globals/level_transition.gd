extends CanvasLayer

var level_scene: PackedScene

func _ready():
	$ColorRect.visible = false

func level_transition(scene_path):
	$ColorRect.visible = true
	level_scene = load(scene_path)
	$AnimationPlayer.play("fade_to_black")
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_packed.call_deferred(level_scene)
	$AnimationPlayer.play_backwards("fade_to_black")
