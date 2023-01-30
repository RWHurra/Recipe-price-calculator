extends ConfirmationDialog

@onready var main = get_tree().get_current_scene()
@onready var linked_recipe
@onready var linked_button
@onready var edit_recipe_item_container_scene = preload("res://edit_recipe_item_container.tscn")
@onready var vertical_box = $VBoxContainer
@onready var recipe_name = $VBoxContainer/Name

func set_recipe(value):
	linked_recipe = value

func get_recipe():
	return linked_recipe

func set_button(value):
	linked_button = value 

func set_values(recipe):
	print("IN SET VALUES")
	print(recipe, recipe.name)
	print("name: ", recipe.get("recipe_name"))
	recipe_name.set_text(recipe.get("recipe_name"))
	var items = recipe.get_items()
	var quantities = recipe.get_quantities()
	var counter = 0
	for item in items:
		var edit_recipe_item_container_instance = edit_recipe_item_container_scene.instantiate()
		vertical_box.add_child(edit_recipe_item_container_instance)
		edit_recipe_item_container_instance.set_name(item.get("item_name"))
		edit_recipe_item_container_instance.set_quantity(quantities[counter])
		edit_recipe_item_container_instance.set_unit(item.get("unit"))
		counter = counter + 1
	

func _on_delete_pressed():
	main.delete_recipe(linked_recipe)
	linked_recipe.queue_free()
	linked_button.queue_free()
