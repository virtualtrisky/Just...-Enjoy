extends Control

@onready var PauseScreen: Control = $PauseScreen

func _ready() -> void:
	Global.hide_cursor()
	PauseScreen.visible = false

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("key_pause"):
		get_tree().paused = not get_tree().paused
		PauseScreen.visible = get_tree().paused
		
		if get_tree().paused == true:
			Global.show_cursor()
			$PauseScreen/VBoxContainer/ContinueBtn.grab_focus()
		else:
			Global.hide_cursor()


func _on_continue_btn_pressed() -> void:
	Global.hide_cursor()
	get_tree().paused = false
	PauseScreen.visible = false


func _on_quit_btn_pressed() -> void:
	Global.stop_music()
	await Global.wait_music_event()
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/menu_scene.tscn")
