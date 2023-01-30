extends ConfirmationDialog

@onready var main = get_tree().get_current_scene()

@onready var item_name = $VBoxContainer/Name
@onready var item_price = $VBoxContainer/Price
@onready var item_unit = $VBoxContainer/Unit

@onready var linked_item
@onready var linked_button

# Called when the node enters the scene tree for the first time.
func _ready():
	set_hide_on_ok(false)

func set_item(value):
	linked_item = value
	
func get_item():
	return linked_item
	
func set_button(value):
	linked_button = value

func set_values(item):
	item_name.set_text(item.get("item_name"))
	item_price.set_text(item.get("price"))
	item_unit.set_text(item.get("unit"))


func _on_confirmed():
	if item_name.text == null or item_name.text == "":
		print("item must have a name")
		main.create_dialog_warning("item name")
		return
	if item_price.text == null or item_price.text == "":
		print("item must have a price")
		main.create_dialog_warning("item price")
		return
	if item_unit.text == null or item_unit.text == "":
		print("item price must have a unit")
		main.create_dialog_warning("item price unit")
		return
	
	linked_item.set("item_name", item_name.text)
	linked_item.set("price", item_price.text)
	linked_item.set("unit", item_unit.text)
	
	linked_button.set_button_text(item_name.text)
	
	queue_free()


func _on_delete_pressed():
	main.delete_item(linked_item)
	linked_item.queue_free()
	linked_button.queue_free()
