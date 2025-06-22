extends TabBar

@export var MasterVolumeSlider: HSlider

func _ready() -> void:
	MasterVolumeSlider.value = Global.config["config.volume.master"]

func _on_h_slider_value_changed(value: float) -> void:
	Global.config["config.volume.master"] = value
	Global.write_config_file()
