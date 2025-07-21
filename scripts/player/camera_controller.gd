extends Camera2D

@onready var player: CharacterBody2D = $".."


func update_limit(top: int, left: int, right: int, bottom: int) -> void:
	limit_top    = top
	limit_left   = left
	limit_right  = right
	limit_bottom = bottom
