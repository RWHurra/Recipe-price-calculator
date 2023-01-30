extends ConfirmationDialog

@onready var main = get_tree().get_current_scene()
@onready var items = main.get_items()
@onready var item_list = $ItemList
@onready var linked_instantiator

# Called when the node enters the scene tree for the first time.
func _ready():
	for item in items:
		item_list.add_item(item.get("item_name"), null, true)

func set_instantiator(value):
	linked_instantiator = value


func _on_confirmed():
	print(items)
	if !item_list.is_anything_selected():
		return
	print(item_list.get_selected_items(), ": ", items[item_list.get_selected_items()[0]])
	linked_instantiator.add_item(items[item_list.get_selected_items()[0]])
