extends CharacterBody2D

const MOVE_SPEED = 1000

func move(delta: float) -> void:
	var horizontal := Input.get_axis("move_left", "move_right")
	var vertical   := Input.get_axis("move_up", "move_down")
	var direction := Vector2(horizontal, vertical)
	
	if direction != Vector2.ZERO:
		direction = direction.normalized()
	
	velocity = direction * MOVE_SPEED * delta



func _ready() -> void:
	Global.play_music("res://musics/Sleep Music No. 1 - Chris Haugen.mp3")


func _physics_process(delta: float) -> void:
	move(delta)
	
	move_and_slide()
