extends Node2D

@onready var recipe_items : Array = []
@onready var recipe_quantities : Array = []

@onready var recipe_name: String:
	get:
		return recipe_name
	set(value):
		recipe_name = value

@onready var linked_button: Button:
	get:
		return linked_button
	set(value):
		linked_button = value

func get_total_cost():
	print("======= IN GET TOTAL COST (RECIPE) =======")
	var items = get_items_in_recipe()
	var quantities = get_quantities()
	print("quantities: ", quantities)
	
	var total_cost = 0
	var counter = 0 
	for item in items:
		var price = item.get("price")
		total_cost = total_cost + float(price) * float(quantities[counter])
		counter = counter +1
	print("======= END GET TOTAL COST (RECIPE) =======")
	return total_cost

func get_items_in_recipe():
	return recipe_items

func clear_items():
	recipe_items.clear()

func get_quantities():
	return recipe_quantities

func clear_quantities():
	recipe_quantities.clear()

func add_item_to_recipe(item, quantity):
	print("======= IN ADD ITEM TO RECIPE (RECIPE) =======")
	print("ITEMS IN RECIPE: ", get_items_in_recipe())
	for current_item in get_items_in_recipe():
		if current_item == item:
			print("WILL NOT ADD ITEM: ", current_item, ", IN RECIPE ALREADY")
			return
	recipe_items.append(item)
	recipe_quantities.append(quantity)
	print("RECIPE ITEMS: ", get_items_in_recipe())
	print("RECIPE QUANTITIES ", get_quantities())
	print("======= END ADD ITEM (RECIPE) =======")

func delete_item(value):
	recipe_items.erase(value)
