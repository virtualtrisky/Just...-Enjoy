extends OptionButton


func _ready() -> void:
	print("sim")
	print(Global.SUPPORTED_LANGS.find(Global.config["config.lang"]))
	print(Global.config["config.lang"])
	self.selected = Global.SUPPORTED_LANGS.find(Global.config["config.lang"])
	select(self.selected)


func _on_item_selected(index: int) -> void:
	Global.set_locale(Global.SUPPORTED_LANGS[index])
