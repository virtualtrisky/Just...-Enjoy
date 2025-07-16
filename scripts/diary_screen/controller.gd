extends Control

@onready var fade_screen: Control = $FadeScreen


func _on_return_pressed() -> void:
	await fade_screen.fade_in()
	get_tree().change_scene_to_file("res://scenes/menu_scene.tscn")
