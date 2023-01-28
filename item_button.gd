extends Button

#@onready var item_name
#@onready var item_price
#@onready var item_price_unit
@onready var linked_item
@onready var edit_item_dialog_scene = preload("res://edit_item_dialog.tscn")
var button


# Called when the node enters the scene tree for the first time.
func _ready():
	button = find_child("Button")
	print("button", button)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#func create_item(recieved_item_name : String, recieved_item_price : String, recieved_item_price_unit : String):
#	item_name = recieved_item_name
#	item_price = recieved_item_price
#	item_price_unit = recieved_item_price_unit
#	print("create item!")

func set_button_text(button_text : String):
	self.set_text(button_text)
	
func set_item(value):
	linked_item = value
	
func get_item():
	return linked_item


func _on_button_pressed():
	pass


func _on_pressed():
	print("linked item: ", get_item())
	var edit_item_dialog_instance = edit_item_dialog_scene.instantiate()
	edit_item_dialog_instance.set_item(self.get_item())
	edit_item_dialog_instance.set_button(self)
#	item_dialog_instance.set_button_text(linked_item.get("item_name"))
	add_child(edit_item_dialog_instance)
	edit_item_dialog_instance.set_visible(true)
	edit_item_dialog_instance.set_values(get_item())
