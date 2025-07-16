extends Node

var active_tab_index = 0
@onready var tabs: Array[TabBar] = [
	$Screen/MarginContainer/TabContainer/Game,
	$Screen/MarginContainer/TabContainer/Options,
	$Screen/MarginContainer/TabContainer/About
]


func update_focus():
	if active_tab_index == 0:
		$Screen/MarginContainer/TabContainer/Game/MarginContainer/VBoxContainer/Panel/VBoxContainer/PlayButton.grab_focus()
	elif active_tab_index == 1:
		$Screen/MarginContainer/TabContainer/Options/MarginContainer/VBoxContainer/VolumeCamp/MasterVolume/HSlider.grab_focus()


func update_tab():
	if active_tab_index < 0: active_tab_index = 2
	elif active_tab_index > 2: active_tab_index = 0
	
	for i in range(tabs.size()):
		tabs[i].visible = false if active_tab_index != i else true
	
	update_focus()


func _ready() -> void:
	await get_tree().create_timer(0.1).timeout
	print(Global.is_music_playing)
	if not Global.is_music_playing:
		Global.play_music("res://musics/Long Walks - Emily A. Sprague.mp3")


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("controller_LT"):
		active_tab_index -= 1
		update_tab()
	elif Input.is_action_just_pressed("controller_RT"):
		active_tab_index += 1
		update_tab()
