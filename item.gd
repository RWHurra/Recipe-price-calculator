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

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
