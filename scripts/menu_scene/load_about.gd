extends TabBar


@onready var GameVersionLabel: Label = $MarginContainer/VBoxContainer/GameVersion

var langs: Dictionary = {
	"en": "Version {0}",
	"pt_BR": "Versao {0}"
}

func _ready() -> void:
	#var version_str = langs[OS.get_locale()].format([Global.config["config.app_version"]])
	var version_str = tr(GameVersionLabel.text).format([Global.config["config.app_version"]])
	GameVersionLabel.text = version_str
