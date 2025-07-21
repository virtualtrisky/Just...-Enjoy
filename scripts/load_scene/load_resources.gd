extends Node


func load_resources() -> bool:
	if not FileAccess.file_exists(Global.config_file_path):  return Global.write_config_file()
	else: return Global.read_config_file()


func update_language() -> void:
	if Global.config["config.lang"] == null:
		if Global.SUPPORTED_LANGS.find(OS.get_locale()):
			Global.set_locale(OS.get_locale())
		else:
			Global.set_locale("en")
	else:
		Global.set_locale(Global.config["config.lang"])


func _ready() -> void:
	if not load_resources():
		print("Failed to load resources.")
		$MarginContainer/Label.text = "Failed to load some resources."
		return
		
	$MarginContainer/Label.text = "Resources loaded."
	update_language()
	await get_tree().create_timer(2).timeout
	
	if Global.config["player.name"] == null:
		get_tree().change_scene_to_file("res://scenes/set_name_scene.tscn")
		return
	
	var master_volume: float = Global.config["config.volume.master"] / 100
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear_to_db(master_volume))
	get_tree().change_scene_to_file("res://scenes/menu_scene.tscn")
