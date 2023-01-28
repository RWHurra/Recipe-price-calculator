extends Button

@onready var main = get_tree().get_current_scene()
@onready var items
@onready var grid = get_parent().get_node("GridContainer")

func _on_pressed():
	items = main.get_items()
	var item_list = ItemList.new()
	print(items)
	for item in items:
		print(item)
		item_list.add_item(item.get("item_name"), null, true)
	grid.add_child(item_list)
	item_list.show()
