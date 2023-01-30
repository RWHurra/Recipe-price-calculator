extends Button

@onready var linked_item
@onready var edit_item_dialog_scene = preload("res://edit_item_dialog.tscn")

func set_button_text(button_text : String):
	self.set_text(button_text)
	
func set_item(value):
	linked_item = value
	
func get_item():
	return linked_item

func _on_pressed():
	print("linked item: ", get_item())
	var edit_item_dialog_instance = edit_item_dialog_scene.instantiate()
	add_child(edit_item_dialog_instance)
	edit_item_dialog_instance.set_item(get_item())
	edit_item_dialog_instance.set_button(self)
	edit_item_dialog_instance.set_values(get_item())
