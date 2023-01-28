extends Button

@onready var create_item_dialog_scene = preload("res://create_item_dialog.tscn")
@onready var offset = Vector2(100, 100)

func _on_pressed():
	var create_item_dialog_instance = create_item_dialog_scene.instantiate()
	create_item_dialog_instance.position = offset
	add_sibling(create_item_dialog_instance)
	create_item_dialog_instance.show()
