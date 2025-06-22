extends TabBar


@onready var GameVersionLabel: Label = $MarginContainer/VBoxContainer/GameVersion


func _ready() -> void:
	GameVersionLabel.text = "Version {0}".format([Global.config["config.app_version"]])
