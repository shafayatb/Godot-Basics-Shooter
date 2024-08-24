extends Node2D


func _on_area_2d_body_entered(body):
	print(body)
	print("body entered")


func _on_area_2d_body_exited(body):
	print("body exited")
