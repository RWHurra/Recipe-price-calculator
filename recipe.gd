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
	var items = get_items()
	var quantities = get_quantities()
	
	var total_cost = 0
	var counter = 0 
	for item in items:
		var price = item.get("price")
		total_cost = total_cost + float(price) * float(quantities[counter])
		counter = counter +1
	return total_cost

func get_items():
	return recipe_items

func get_quantities():
	return recipe_quantities

func add_item(item, quantity):
	print("in 'add_item' recipe")
	print("recipe_items: ", recipe_items)
	recipe_items.append(item)
	recipe_quantities.append(quantity)
	print("recipe_items: ", recipe_items)
	print("recipe_quantities: ", recipe_quantities)

func delete_item(value):
	recipe_items.erase(value)
