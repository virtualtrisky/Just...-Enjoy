extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var player_name: String = Global.config["player.name"] if Global.config["player.name"] != null else "no name"
	text = "Hello,${0}".format([player_name])
