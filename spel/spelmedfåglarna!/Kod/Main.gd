extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
		var volume_menu_scene = preload("res://Settings.tscn")
		var menu_instance = volume_menu_scene.instantiate()
		add_child(menu_instance)
