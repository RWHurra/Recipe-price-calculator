extends ConfirmationDialog

@onready var main = get_tree().get_current_scene()
@onready var items = main.get_items()
@onready var item_list = $ItemList
@onready var linked_create_recipe

# Called when the node enters the scene tree for the first time.
func _ready():
	for item in items:
		item_list.add_item(item.get("item_name"), null, true)

func set_create_recipe(value):
	linked_create_recipe = value


func _on_confirmed():
	print(items)
	print(item_list.get_selected_items(), ": ", items[item_list.get_selected_items()[0]])
	linked_create_recipe.add_item(items[item_list.get_selected_items()[0]])
