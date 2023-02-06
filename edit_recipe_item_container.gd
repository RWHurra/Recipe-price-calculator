extends HBoxContainer

@onready var item_name = $Name
@onready var quantity = $Quantity
@onready var unit = $Unit

func set_name(value):
	item_name.set_text(value)

func set_quantity(value):
	quantity.set_text(value)

func get_quantity():
	return quantity.get_text()

func get_quantity_node():
	return quantity

func set_unit(value):
	unit.set_text(value)
