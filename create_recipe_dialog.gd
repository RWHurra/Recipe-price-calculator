extends ConfirmationDialog

@onready var main = get_tree().get_current_scene()

@onready var recipe_name = $VBoxContainer/Name
@onready var grid = $VBoxContainer/GridContainer
@onready var recipe_scene = preload("res://recipe.tscn")
@onready var recipe_button_scene = preload("res://recipe_button.tscn")
@onready var added_items : Array
@onready var added_quantity : Array

func _ready():
	set_hide_on_ok(false)

func add_item(value):
	print("======= IN ADD ITEM (CREATE RECIPE) =======")
	for item in added_items:
		if value == item[0]:
			print("ITEM ALREADY IN RECIPE")
			return
	
	var item_name = Label.new()
	item_name.set_text(value.get("item_name"))
	grid.add_child(item_name)
	
	var item_quantity = TextEdit.new()
	item_quantity.set_placeholder("Quantity")
	item_quantity.set("custom_minimum_size", Vector2(100, 40))
	grid.add_child(item_quantity)
	added_quantity.append(item_quantity)
	
	var item_unit = Label.new()
	item_unit.set_text(value.get("unit").replace("kr/", ""))
	grid.add_child(item_unit)
	
	var added_item = [value, item_quantity.text]
#	print("added item: ", added_item)
	
	added_items.push_back(added_item)
#	print("added items: ", added_items)
	print("======= END ADD ITEM (CREATE RECIPE) =======")

func _on_confirmed():
	print("======= IN ON CONFIRMED (CREATE RECIPE) =======")
	if recipe_name.get_text() == null or recipe_name.get_text() == "":
		main.create_dialog_warning("recipe name")
		return
		
	var recipe_instance = recipe_scene.instantiate()
	recipe_instance.set("recipe_name", recipe_name.get_text())
	print("Recipe created with name: ", recipe_instance.get("recipe_name"))
	
	var recipe_button_instance = recipe_button_scene.instantiate()
	recipe_button_instance.set_recipe(recipe_instance)
	
	recipe_instance.set("linked_button", recipe_button_instance)
	main.add_recipe(recipe_instance)
	
	var counter = 0
	for item in added_items:
		print("item in for loop: ", item)
		print("item[0] in for loop: ", item[0])
		print(added_quantity[counter])
		recipe_instance.add_item_to_recipe(item[0], added_quantity[counter].get_text())
		counter = counter + 1
	
	recipe_button_instance.set_button_text(recipe_name.get_text() + ": " + str(recipe_instance.get_total_cost()) + " kr")
	print("======= END ON CONFIRMED (CREATE RECIPE) =======")
	queue_free()
