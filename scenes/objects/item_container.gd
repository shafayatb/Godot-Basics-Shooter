extends StaticBody2D

class_name ItemContainer

signal open(pos, direction)

var opened: bool = false

@onready var current_position := Vector2.DOWN.rotated(rotation)
