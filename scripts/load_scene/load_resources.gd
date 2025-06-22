extends Node


func write_config_file() -> bool:
	var file: FileAccess
	
	var json_str := JSON.stringify(Global.config)
	file = FileAccess.open(Global.config_file_path, FileAccess.WRITE)
	
	if not file:
		print("Failed to create file")
		return false
	
	print("Resources created")
	file.store_string(json_str)
	file.close()
	return true


func read_config_file() -> bool:
	var file := FileAccess.open(Global.config_file_path, FileAccess.READ)
	
	if not file:
		print("Failed to open file")
		return false
	
	var json_string = file.get_as_text()
	var json = JSON.parse_string(json_string)
	
	if json == null:
		print("Failed to parse JSON")
		return false
	
	
	print("Resources loaded")
	Global.config = json
	file.close()
	return true

func load_resources() -> bool:
	if not FileAccess.file_exists(Global.config_file_path):  return write_config_file()
	else: return read_config_file()


func _ready() -> void:
	if not load_resources():
		print("Failed to load resources.")
		$MarginContainer/Label.text = "Failed to load some resources."
		return
		
	$MarginContainer/Label.text = "Resources loaded."
	await get_tree().create_timer(1).timeout
	
	get_tree().change_scene_to_file("res://scenes/menu_scene.tscn")
