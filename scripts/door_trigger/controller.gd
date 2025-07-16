extends Area2D

@export var to_scene: String
@export var to_position: Vector2
@export var fade_screen: Control
@export var player: CharacterBody2D

var player_nearby: bool = false

func change_scene():
	
	Global.map_changer_options["position"] = to_position
	Global.map_changer_options["frame_y"] = player.sprite.frame_coords.y
	Global.map_changer_options["used"] = true
	
	await fade_screen.fade_in()
	get_tree().change_scene_to_file(to_scene)


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("key_action"): change_scene()


func _on_body_entered(body: Node2D) -> void:
	if body.name != "Player": return
	player_nearby = true


func _on_body_exited(body: Node2D) -> void:
	if body.name != "Player": return
	player_nearby = false
