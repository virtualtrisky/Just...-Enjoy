extends Control

@onready var description_label: Label = $"../../VBoxContainer/Label"


func _on_focus_entered(index: int) -> void:
	description_label.text = Inventory.items[index].description


func _on_focus_exited() -> void:
	description_label.text = ""
