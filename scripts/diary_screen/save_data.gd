extends Button

@export var is_valid: bool = false
@export var save_name: String = "No Data"
@export var save_id: int

var id: String


func load_data() -> void:
	id = "page_{0}".format([save_id])
	var save: Dictionary = Global.config.saves[id]
	
	if not save.is_valid: return
	
	is_valid = true
	save_name = save.name

func _ready() -> void:
	load_data()
	if not is_valid:
		disabled = true
		return
	
	text = id.replace("_", " ") + " - " + save_name


func _pressed() -> void:
	print("page name: ", save_name)
	print("is valid: ", is_valid)
	print("index: ", save_id)
