extends Button

@onready var main = get_tree().get_current_scene()
@onready var items = main.get_items()
@onready var grid = get_parent().get_node("GridContainer")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	var item_list = ItemList.new()
	for item in items:
		item_list.add_item(item.name, null, true)
	grid.add_child(item_list)
	item_list.show()
