extends Node2D

@onready var recipe_items : Dictionary

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

func add_item(item, quantity):
	recipe_items.item = quantity
	print("recipe_items: ", recipe_items)
	print("recipe_items.item: ", recipe_items.item)

func delete_item(value):
	recipe_items.erase(value)
