extends Control

@onready var items : Array
@onready var item_list = $TabContainer/Item

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func get_items():
	return items
	
func add_item(new_item):
#	new_item.set_button_text(new_item.name)
	item_list.add_child(new_item)
	items.push_back(new_item)

func create_dialog_warning(warning_reason : String):
	var dialog_warning = AcceptDialog.new()
	dialog_warning.set_title("Warning")
	dialog_warning.set_text("Missing " + warning_reason + ", please add.")
	dialog_warning.set_position(Vector2(100, 100))
	add_child(dialog_warning)
	dialog_warning.set_visible(true)
