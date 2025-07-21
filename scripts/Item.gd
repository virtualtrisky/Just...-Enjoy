extends Node

class_name Item

var item_name: String
var sprite_path: String
var description: String


func _init(_name: String, sprite: String, descrip) -> void:
	item_name = _name
	sprite_path = sprite
	description = descrip
