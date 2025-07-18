extends Node

class_name Item

var item_name: String
var sprite_path: String


func _init(_name: String, sprite: String) -> void:
	item_name = _name
	sprite_path = sprite
