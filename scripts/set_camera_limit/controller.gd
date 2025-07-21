extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if not body.name == "Player" and not body is CharacterBody2D: return
	
	var camera: Camera2D = body.camera
	
	camera.update_limit(-1000000, -168, 88, 65)
