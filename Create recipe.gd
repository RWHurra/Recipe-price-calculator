extends Button

@onready var create_recipe_dialog_scene = preload("res://create_recipe_dialog.tscn")
@onready var offset = Vector2(100, 100)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	var create_recipe_dialog_instance = create_recipe_dialog_scene.instantiate()
	create_recipe_dialog_instance.position = offset
	add_sibling(create_recipe_dialog_instance)
	create_recipe_dialog_instance.show()
