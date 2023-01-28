extends ConfirmationDialog

@onready var item_name = $VBoxContainer/Name
@onready var item_price = $VBoxContainer/Price
@onready var item_unit = $VBoxContainer/Unit

@onready var linked_item
@onready var linked_button

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_item(value):
	linked_item = value
	
func get_item():
	return linked_item
	
func set_button(value):
	linked_button = value

func set_values(item):
	print("item: ", item)
	print("item_name: ", item_name)
	print("item item_name: ", item.get("item_name"))

	print("item_price: ", item_price)
	print("item item_price: ", item.get("price"))
	
	print("item_unit: ", item_unit)
	print("item item_unit: ", item.get("unit"))

	item_name.text = item.get("item_name")
	item_price.text = item.get("price")
	item_unit.text = item.get("unit")


func _on_confirmed():
	linked_item.set("item_name", item_name.text)
	linked_item.set("price", item_price.text)
	linked_item.set("unit", item_unit.text)
	
	linked_button.set_button_text(item_name.text)
	
	queue_free()
