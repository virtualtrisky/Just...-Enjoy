extends Node

var item_list: Dictionary = {
	"some_item": { "name": "some_item", "sprite_path": "no_path"  }
}

var items: Array[Item]

func create_item(_item: Dictionary) -> Item:
	var item := Item.new(_item.name, _item.sprite_path)
	return item


func add_item(item: Item) -> void:
	items.push_back(item)


func search(item_name: String) -> int:
	for i in range(items.size()):
		if items[i].item_name == item_name: return i
	
	return -1


func remove(item_name: String) -> void:
	items.remove_at(search(item_name))
