extends ConfirmationDialog

@onready var main = get_tree().get_current_scene()
@onready var linked_recipe
@onready var linked_button
@onready var edit_recipe_item_container_scene = preload("res://edit_recipe_item_container.tscn")
@onready var vertical_box = $VBoxContainer
@onready var recipe_name = $VBoxContainer/Name
@onready var cost = $VBoxContainer/HBoxContainer/Cost
@onready var added_items : Array
@onready var added_quantity : Array
@onready var recipe_items_in_edit : Array
@onready var recipe_quantities : Array
@onready var recipe_quantities_nodes : Array

func set_recipe(value):
	linked_recipe = value

func get_recipe():
	return linked_recipe

func set_button(value):
	linked_button = value

func set_values(recipe):
	print("======= IN SET VALUES (EDIT RECIPE) =======")
	print("RECIPE NAME: ", recipe.get("recipe_name"))
	recipe_name.set_text(recipe.get("recipe_name"))
	recipe_items_in_edit = recipe.get_items_in_recipe().duplicate()
	print("RECIPE ITEMS: ", recipe_items_in_edit)
	recipe_quantities = recipe.get_quantities().duplicate()
	print("RECIPE QUANTITIES: ", recipe_quantities)
	var counter = 0
	for item in recipe_items_in_edit:
		var edit_recipe_item_container_instance = edit_recipe_item_container_scene.instantiate()
		vertical_box.add_child(edit_recipe_item_container_instance)
		edit_recipe_item_container_instance.set_name(item.get("item_name"))
		if counter < recipe_quantities.size():
			edit_recipe_item_container_instance.set_quantity(recipe_quantities[counter])
		edit_recipe_item_container_instance.set_unit(item.get("unit").replace("kr/", ""))
		recipe_quantities_nodes.append(edit_recipe_item_container_instance.get_quantity_node())
		counter = counter + 1

	var total_cost = recipe.get_total_cost()
	cost.set_text(str(total_cost))
	
	print("======= END SET VALUES (EDIT RECIPE) =======")
	

func add_item(value):
	print("======= IN ADD ITEM EDIT RECIPE (EDIT RECIPE) =======")
	var items = linked_recipe.get_items_in_recipe().duplicate()
	print("RECIPE ITEMS: ", items)
	for item in items:
		if value == item:
			print("ITEM ALREADY IN RECIPE")
			return
	print("RECIPE ITEMS STILL EMPTY 1??: ", items)
	var edit_recipe_item_container_instance = edit_recipe_item_container_scene.instantiate()
	vertical_box.add_child(edit_recipe_item_container_instance)
	edit_recipe_item_container_instance.set_name(value.get("item_name"))
	edit_recipe_item_container_instance.set_unit(value.get("unit").replace("kr/", ""))
	recipe_quantities_nodes.append(edit_recipe_item_container_instance.get_quantity_node())
	recipe_items_in_edit.append(value)
	print("RECIPE QUANTITY NODE TO ADD: ", recipe_quantities_nodes)
	print("RECIPE ITEMS TO ADD: ", recipe_items_in_edit)
	print("======= END ADD ITEM EDIT RECIPE (EDIT RECIPE) =======")

func _on_delete_pressed():
	main.delete_recipe(linked_recipe)
	linked_recipe.queue_free()
	linked_button.queue_free()


func _on_confirmed():
	print("======= IN ON CONFIRMED (EDIT RECIPE) =======")
	var recipe = get_recipe()
	print("RECIPE TO EDIT: ", linked_recipe)
	print("RECIPE ITEMS: ", linked_recipe.get_items_in_recipe())
	print("ITEMS TO ADD TO RECIPE: ", recipe_items_in_edit)
	recipe.clear_items()
	recipe.clear_quantities()
	
	recipe.set("recipe_name", recipe_name.get_text())
	
	var counter = 0
	for item_to_add in recipe_items_in_edit:
		print("ADDING ITEM: ", item_to_add)
		print("ADDING QUANTITY: ", recipe_quantities_nodes[counter].get_text())
		recipe.add_item_to_recipe(item_to_add, recipe_quantities_nodes[counter].get_text())
		counter = counter + 1
	
	linked_button.set_button_text(recipe.get("recipe_name") + ": " + str(recipe.get_total_cost()) + " kr")
	print("======= END ON CONFIRMED (EDIT RECIPE) =======")
