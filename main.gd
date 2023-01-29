extends Control

@onready var items : Array
@onready var item_list = $TabContainer/Item

@onready var recipies : Array
@onready var recipe_list = $TabContainer/Recipe

func get_items():
	return items
	
func add_item(new_item):
	item_list.add_child(new_item.get("linked_button"))
	items.push_back(new_item)

func delete_item(item):
	items.erase(item)

func get_recipies():
	return recipies

func add_recipe(new_recipe):
	add_child(new_recipe)
	recipe_list.add_child(new_recipe.get("linked_button"))
	recipies.push_back(new_recipe)

func delete_recipe(recipe):
	recipies.erase(recipe)

func create_dialog_warning(warning_reason : String):
	var dialog_warning = AcceptDialog.new()
	dialog_warning.set_title("Warning")
	dialog_warning.set_text("Missing " + warning_reason + ", please add.")
	dialog_warning.set_position(Vector2(100, 100))
	add_child(dialog_warning)
	dialog_warning.set_visible(true)
