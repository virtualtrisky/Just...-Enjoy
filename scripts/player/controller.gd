extends CharacterBody2D

const MOVE_SPEED = 1000

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
var animation: String = "IDLE"
var current_animation = "IDLE"

func update_animation() -> void:
	if animation != current_animation:
		current_animation = animation
	
	if animation != "IDLE": animation_player.play(animation)
	else: sprite.frame_coords.x = 3

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
	animation = "IDLE"
	for action in DIRECTION_MAP.keys():
		if Input.is_action_pressed(action):
			animation = DIRECTION_MAP[action]
			break
	
	update_animation()


func _physics_process(delta: float) -> void:
	move(delta)
	
	move_and_slide()
