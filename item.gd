extends Node2D

@onready var item_name: String:
	get:
		return item_name
	set(value):
		item_name = value
		
@onready var price: String:
	get:
		return price
	set(value):
		price = value
		
@onready var unit: String:
	get:
		return unit
	set(value):
		unit = value
		
@onready var linked_button: Button:
	get:
		return linked_button
	set(value):
		linked_button = value
