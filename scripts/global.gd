extends Node


const config_file_path: String = "user://config.json"
var config: Dictionary = {
	"config.app_version": "0.0.0",
	"config.volume.master": 100,
	"player.name": null
}


func write_config_file() -> bool:
	var file: FileAccess
	
	var json_str := JSON.stringify(config)
	file = FileAccess.open(config_file_path, FileAccess.WRITE)
	
	if not file:
		print("Failed to create file")
		return false
	
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
	
	
	config = json
	file.close()
	return true


func stop_music():
	var audio_animation: AnimationPlayer  = GlobalAudioStreamPlayer.get_children()[0]
	
	audio_animation.play("stop_music")
	await audio_animation.animation_finished
	GlobalAudioStreamPlayer.stop()


func play_music(path: String):
	var audio_animation: AnimationPlayer  = GlobalAudioStreamPlayer.get_children()[0]
	var new_stream = load(path)
	new_stream = new_stream.duplicate()
	new_stream.loop = true
	
	audio_animation.play("stop_music")
	await audio_animation.animation_finished
	GlobalAudioStreamPlayer.stop()
	
	GlobalAudioStreamPlayer.stream = new_stream
	GlobalAudioStreamPlayer.play()
	audio_animation.play("play_music")
