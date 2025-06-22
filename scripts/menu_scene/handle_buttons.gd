# This script is attached in node called "Game"

extends TabBar


func _on_play_button_pressed() -> void:
	print("Nothing happens")


func _on_exit_button_pressed() -> void:
	get_tree().quit()
