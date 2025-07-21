extends Node2D

@export var fade_screen: Control
@export var player: CharacterBody2D

var finished: bool = false

func _ready() -> void:
	await get_tree().create_timer(0.1).timeout
	if Global.map_changer_options.used:
		player.position = Global.map_changer_options.position
		player.sprite.frame_coords.y = Global.map_changer_options.frame_y
		
		await fade_screen.await_finish()
		Global.map_changer_options.used = false
		Global.player_can_move = true
	
	
	# play music
	print(Global.is_music_playing)
	if not Global.is_music_playing and not Global.music_name == "res://musics/Sleep Music No. 1 - Chris Haugen.mp3":
		Global.play_music("res://musics/Sleep Music No. 1 - Chris Haugen.mp3")
	
	finished = true
