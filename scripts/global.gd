extends Node

var player_can_move: bool = true

var is_music_playing: bool = false
var music_name: String

# used when map changes when a "map_changer" is used
var map_changer_options: Dictionary = {
	"position": Vector2(0, 0),
	"frame_y": int(0),
	"used": false
}


const config_file_path: String = "user://config.json"
var config: Dictionary = {
	"config.app_version": "0.0.1-test",
	"config.volume.master": 100,
	"player.name": null,
	"saves": {
		"page_0": { "is_valid": false },
		"page_1": { "is_valid": false },
		"page_2": { "is_valid": false },
		"page_3": { "is_valid": false },
		"page_4": { "is_valid": false }
	}
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


func wait_music_event() -> Signal:
	var audio_animation: AnimationPlayer  = GlobalAudioStreamPlayer.get_children()[0]
	
	return audio_animation.animation_finished

func stop_music() -> void:
	print("stop called")
	var audio_animation: AnimationPlayer  = GlobalAudioStreamPlayer.get_children()[0]
	
	audio_animation.play("stop_music")
	await audio_animation.animation_finished
	GlobalAudioStreamPlayer.stop()
	is_music_playing = false
	music_name = "None"


func play_music(path: String) -> void:
	print("play called")
	var audio_animation: AnimationPlayer  = GlobalAudioStreamPlayer.get_children()[0]
	var new_stream = load(path)
	new_stream = new_stream.duplicate()
	new_stream.loop = true
	is_music_playing = true
	music_name = path
	
	audio_animation.play("stop_music")
	await audio_animation.animation_finished
	GlobalAudioStreamPlayer.stop()
	
	GlobalAudioStreamPlayer.stream = new_stream
	GlobalAudioStreamPlayer.play()
	audio_animation.play("play_music")


func hide_cursor() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)


func show_cursor() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
