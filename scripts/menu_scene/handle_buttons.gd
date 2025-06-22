# This script is attached in node called "Game"

extends TabBar


func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/world/debug_scene.tscn")


func _on_exit_button_pressed() -> void:
	get_tree().quit()


func _on_continue_button_2_pressed() -> void:
	print("Open Diary")
