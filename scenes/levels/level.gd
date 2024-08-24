extends Node2D


func _on_gate_player_entered_gate(body):
	print("Player has entered gate")
	print(body)


func _on_player_granede():
	print("grenade emitted")


func _on_player_laser():
	print("laser emitted")
