extends ConfirmationDialog

@onready var main = get_tree().get_current_scene()
@onready var container = $VBoxContainer
@onready var item_name = $VBoxContainer/Name
@onready var item_price = $VBoxContainer/Price
@onready var item_unit = $VBoxContainer/Unit

@onready var item_button_scene = preload("res://item_button.tscn")
@onready var item_scene = preload("res://item.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	set_hide_on_ok(false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_cancelled():
	queue_free()

func _on_confirmed():
	if item_name.text == null or item_name.text == "":
		print("item must have a name")
		_create_dialog_warning("item name")
		return
	if item_price.text == null or item_price.text == "":
		print("item must have a price")
		_create_dialog_warning("item price")
		return
	if item_unit.text == null or item_unit.text == "":
		print("item price must have a unit")
		_create_dialog_warning("item price unit")
		return

	var item_instance = item_scene.instantiate()
	item_instance.set("item_name", item_name.text)
	item_instance.set("price", item_price.text)
	item_instance.set("unit", item_unit.text)
	
	var item_button_instance = item_button_scene.instantiate()
	item_button_instance.set_item(item_instance)
	item_button_instance.set_button_text(item_instance.get("item_name"))
	main.add_item(item_button_instance)
	queue_free()

func _create_dialog_warning(warning_reason : String):
	var dialog_warning = AcceptDialog.new()
	dialog_warning.set_title("Warning")
	dialog_warning.set_text("Missing " + warning_reason + ", please add.")
	dialog_warning.set_position(Vector2(100, 100))
	add_child(dialog_warning)
	dialog_warning.set_visible(true)

var alias: String:
	get:
		return alias
	set(new_alias):
		alias = new_alias