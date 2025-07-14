extends Node

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func is_animation_playing() -> void:
	if animation_player.is_playing():
		animation_player.stop()


func fade_in() -> Signal:
	is_animation_playing()
	animation_player.play("fade_in")
	return animation_player.animation_finished


func fade_out() -> Signal:
	await get_tree().create_timer(0.1).timeout
	is_animation_playing()
	animation_player.play("fade_out")
	return animation_player.animation_finished


func desactive() -> Signal:
	animation_player.play("desactive")
	return animation_player.animation_finished

func await_finish() -> Signal:
	return animation_player.animation_finished
