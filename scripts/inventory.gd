extends Node

var item_list: Dictionary = {
	"no_item": {
		"name": "no_item",
		"sprite_path": "NO_SPRITE",
		"description": ""
	},
	"some_item": {
		"name": "some_item",
		"sprite_path": "res://sprites/inventory/some_item.png",
		"description": "[SOME_ITEM_MSG]"
	}
}

var item_count: int = -1
var items: Array[Item]

func create_item(_item: Dictionary) -> Item:
	var item := Item.new(_item.name, _item.sprite_path, _item.description)
	return item


func add_item(_item: Dictionary) -> void:
	if item_count >= 13:
		return
	
	var item := create_item(_item)
	item_count += 1
	
	items[item_count] = item


func search(item_name: String) -> int:
	for i in range(items.size()):
		if items[i].item_name == item_name: return i
	
	return -1


func remove(item_name: String) -> void:
	items.remove_at(search(item_name))


func _ready() -> void:
	for i in range(14):
		items.push_back(create_item(item_list["no_item"]))
