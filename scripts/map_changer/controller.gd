extends Area2D

@export var player: CharacterBody2D
@export var fade_screen: Control
@export var map_path: String
@export var to_position: Vector2

func _on_body_entered(body: Node2D) -> void:
	if body.name != "Player": return
	
	Global.map_changer_options.used = true
	Global.player_can_move = false
	Global.map_changer_options.position = to_position
	Global.map_changer_options.frame_y = player.sprite.frame_coords.y
	
	await fade_screen.fade_in()
	get_tree().change_scene_to_file(map_path)
