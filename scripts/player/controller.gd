extends CharacterBody2D

const MOVE_SPEED = 1200

# needless
const IDLE_SPRITE_PATH = "res://sprites/player/player-idle.png"
const WALKING_SPRITE_PATH = "res://sprites/player/player-walking.png"

const DIRECTION_MAP: Dictionary = {
	"move_up":    "WALK_UP",
	"move_down":  "WALK_DOWN",
	"move_right": "WALK_RIGHT",
	"move_left":  "WALK_LEFT"
}

@onready var sprite: Sprite2D = $Sprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@export var map_loader: Node2D
var animation: String = "IDLE"
var current_animation = "IDLE"

@export var camera_limit: Dictionary = {
	"use_limit": false,
	"left":  -1, "top":  -1,
	"right": -1, "bottom": -1
}

func update_animation() -> void:
	if animation != current_animation:
		current_animation = animation
	
	if animation != "IDLE": animation_player.play(animation)
	else: sprite.frame_coords.x = 0


func move(delta: float) -> void:
	if Global.player_can_move == false or not map_loader.finished:
		velocity = Vector2.ZERO
		return
	
	var horizontal := Input.get_axis("move_left", "move_right")
	var vertical   := Input.get_axis("move_up", "move_down")
	var direction  := Vector2(horizontal, vertical)
	
	if direction != Vector2.ZERO:
		direction = direction.normalized()
	
	velocity = direction * MOVE_SPEED * delta


func set_camera_limit() -> void:
	if not camera_limit.use_limit: return
	
	var camera: Camera2D = $Camera2D
	
	camera.limit_left   = camera_limit.left
	camera.limit_top    = camera_limit.top
	camera.limit_right  = camera_limit.right
	camera.limit_bottom = camera_limit.bottom


func _ready() -> void:
	set_camera_limit()


func _process(_delta: float) -> void:
	animation = "IDLE"
	
	if velocity.x < 0: animation = "WALK_LEFT"
	elif velocity.x > 0: animation = "WALK_RIGHT"
	elif velocity.y > 0: animation = "WALK_DOWN"
	elif velocity.y < 0: animation = "WALK_UP"
	
	update_animation()


func _physics_process(delta: float) -> void:
	move(delta)
	
	move_and_slide()
