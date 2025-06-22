extends Node


const config_file_path: String = "user://config.json"
var config: Dictionary = {
	"config.app_version": "0.0.0",
	"player.name": null
}


func write_config_file() -> bool:
	var file: FileAccess
	
	var json_str := JSON.stringify(config)
	file = FileAccess.open(config_file_path, FileAccess.WRITE)
	
	if not file:
		print("Failed to create file")
		return false
	
	print("Resources created")
	file.store_string(json_str)
	file.close()
	return true



func read_config_file() -> bool:
	var file := FileAccess.open(config_file_path, FileAccess.READ)
	
	if not file:
		print("Failed to open file")
		return false
	
	var json_string = file.get_as_text()
	var json = JSON.parse_string(json_string)
	
	if json == null:
		print("Failed to parse JSON")
		return false
	
	
	print("Resources loaded")
	config = json
	file.close()
	return true
