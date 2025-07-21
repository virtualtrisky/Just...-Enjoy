extends Control


@onready var inventory_camp: Control = $Camp
@onready var inventory_grid: GridContainer = $Camp/MarginContainer/HSplitContainer/PanelContainer2/MarginContainer/VSplitContainer/GridContainer

func update_item_list() -> void:
	if Inventory.item_count < 0: return # player doesn't have any item
	
	var containers: Array[Node] = inventory_grid.get_children()
	
	for i in range(containers.size()):
		var texture_rect: TextureRect = containers[i].get_child(1)
		
		if not Inventory.items[i].sprite_path == "NO_SPRITE":
			texture_rect.texture = load(Inventory.items[i].sprite_path)


func _ready() -> void:
	inventory_camp.visible = false
	update_item_list()


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		Inventory.add_item(Inventory.item_list["some_item"])
	
	if Input.is_action_just_pressed("key_menu"):
		inventory_camp.visible = not inventory_camp.visible
		get_tree().paused = not get_tree().paused
		Global.hide_cursor()
		
		if get_tree().paused:
			Global.show_cursor()
			update_item_list()
			$Camp/MarginContainer/HSplitContainer/PanelContainer/MarginContainer/VBoxContainer/CloseInventory.grab_focus()
	
	
func _on_close_inventory_pressed() -> void:
	inventory_camp.visible = false
	get_tree().paused = false
	Global.hide_cursor()
