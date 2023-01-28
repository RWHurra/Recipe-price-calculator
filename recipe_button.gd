extends Button

@onready var linked_recipe
@onready var edit_recipe_dialog_scene = preload("res://edit_recipe_dialog.tscn")

func set_button_text(button_text : String):
	self.set_text(button_text)
	
func set_recipe(value):
	linked_recipe = value
	
func get_recipe():
	return linked_recipe


func _on_pressed():
	var edit_recipe_dialog_instance = edit_recipe_dialog_scene.instantiate()
	add_child(edit_recipe_dialog_instance)
