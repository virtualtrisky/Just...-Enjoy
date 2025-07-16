# This script is attached in node called "Game"

extends TabBar


func _ready() -> void:
	$MarginContainer/VBoxContainer/Panel/VBoxContainer/PlayButton.grab_focus()


func _on_play_button_pressed() -> void:
	var fade_animation: AnimationPlayer =  $"../../../../FadeTexture/AnimationPlayer"
	
	fade_animation.play("fade_in")
	Global.stop_music()
	await fade_animation.animation_finished
	get_tree().change_scene_to_file("res://scenes/world/bedroom.tscn")


func _on_exit_button_pressed() -> void:
	var sound_animation: AnimationPlayer = GlobalAudioStreamPlayer.get_children()[0]
	var fade_animation: AnimationPlayer = $"../../../../FadeTexture/AnimationPlayer"
	
	sound_animation.play("stop_music")
	fade_animation.play("fade_in")
	
	await fade_animation.animation_finished
	await sound_animation.animation_finished
	
	get_tree().quit()


func _on_continue_button_2_pressed() -> void:
	var fade_animation: AnimationPlayer =  $"../../../../FadeTexture/AnimationPlayer"
	
	fade_animation.play("fade_in")
	await fade_animation.animation_finished
	get_tree().change_scene_to_file("res://scenes/diary_scene.tscn")


func _on_debug_button_pressed() -> void:
	var fade_animation: AnimationPlayer = $"../../../../FadeTexture/AnimationPlayer"
	
	fade_animation.play("fade_in")
	Global.stop_music()
	await fade_animation.animation_finished
	get_tree().change_scene_to_file("res://scenes/world/debug_scene.tscn")
