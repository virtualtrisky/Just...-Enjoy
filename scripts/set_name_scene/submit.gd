extends Node


func _on_line_edit_text_submitted(new_text: String) -> void:
	Global.config["player.name"] = new_text
	Global.write_config_file()
	
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file("res://scenes/menu_scene.tscn")
