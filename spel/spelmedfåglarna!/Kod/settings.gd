extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Panel/VolumeSlider.value = db_to_linear(AudioServer.get_bus_volume_db(0))
	$Panel/VolumeSlider.connect("value_changed", Callable(self, "_on_slider_value_changed"))
	$Panel/CloseButton.connect("pressed", Callable(self,"_on_close_pressed")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0,linear_to_db(value))
	


func _toggled_on(toggled_on: bool) -> void:
	pass # Replace with function body.


func _on_close_button_pressed() -> void:
	queue_free()
