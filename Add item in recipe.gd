extends Button

@onready var main = get_tree().get_current_scene()
@onready var items
@onready var create_recipe_dialog = get_parent().get_parent()
@onready var item_list_scene = preload("res://add_item_to_recipe_list.tscn")

func _on_pressed():
	var item_list_instance = item_list_scene.instantiate()
	item_list_instance.set_create_recipe(create_recipe_dialog)
	add_sibling(item_list_instance)
	item_list_instance.show()
