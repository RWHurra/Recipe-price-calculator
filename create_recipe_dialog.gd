extends ConfirmationDialog

@onready var main = get_tree().get_current_scene()

@onready var recipe_name = $VBoxContainer/Name
@onready var recipe_scene = preload("res://recipe.tscn")
@onready var recipe_button_scene = preload("res://recipe_button.tscn")

func _ready():
	set_hide_on_ok(false)


func _on_confirmed():
	if recipe_name.text == null or recipe_name.text == "":
		main.create_dialog_warning("recipe name")
		return
		
	var recipe_instance = recipe_scene.instantiate()
	recipe_instance.set("recipe_name", recipe_name.text)
	
	var recipe_button_instance = recipe_button_scene.instantiate()
	recipe_button_instance.set_button_text(recipe_name.text)
	recipe_button_instance.set_recipe(recipe_instance)
	
	recipe_instance.set("linked_button", recipe_button_instance)
	main.add_recipe(recipe_instance)
	
	queue_free()
