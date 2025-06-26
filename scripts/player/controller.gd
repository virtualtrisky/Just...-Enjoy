extends CharacterBody2D

const MOVE_SPEED = 1000

const IDLE_SPRITE_PATH = "res://sprites/player/player-idle.png"
const WALKING_SPRITE_PATH = "res://sprites/player/player-walking.png"

@onready var sprite: Sprite2D = $Sprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
var animation: String = "IDLE"
var current_animation = "IDLE"

func update_animation() -> void:
	if animation != current_animation:
		sprite.texture = load(IDLE_SPRITE_PATH) if animation == "IDLE" else load(WALKING_SPRITE_PATH)
		current_animation = animation
	
	animation_player.play(animation)

func move(delta: float) -> void:
	var horizontal := Input.get_axis("move_left", "move_right")
	var vertical   := Input.get_axis("move_up", "move_down")
	var direction  := Vector2(horizontal, vertical)
	
	if direction != Vector2.ZERO:
		direction = direction.normalized()
	
	velocity = direction * MOVE_SPEED * delta



func _ready() -> void:
	Global.play_music("res://musics/Sleep Music No. 1 - Chris Haugen.mp3")


func _process(delta: float) -> void:
	if    Input.is_action_pressed("move_left"):  animation = "WALK_LEFT"
	elif  Input.is_action_pressed("move_right"): animation = "WALK_RIGHT"
	elif  Input.is_action_pressed("move_up"):    animation = "WALK_UP"
	elif  Input.is_action_pressed("move_down"):  animation = "WALK_DOWN"
	else: animation = "IDLE"
	
	update_animation()


func _physics_process(delta: float) -> void:
	move(delta)
	
	move_and_slide()
