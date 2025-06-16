extends Control

var config = ConfigFile.new()

@onready var volume_slider = $VolumeContainer/VolumeSlider
@onready var mute_checkbox = $MuteContainer/MuteCheckbox
@onready var player = get_node("/root/Node2D/CharacterBody2D")

func _process(_delta: float) -> void:
	global_position = player.global_position + Vector2(100, -50)



func _ready():
	load_settings()
	volume_slider.value_changed.connect(_on_volume_changed)
	mute_checkbox.toggled.connect(_on_mute_toggled)

func _on_volume_changed(value):
	AudioServer.set_bus_volume_db(0, linear_to_db(value))
	save_settings(value, mute_checkbox.button_pressed)

func _on_mute_toggled(pressed):
	var mute_value = -80 if pressed else linear_to_db(volume_slider.value)
	AudioServer.set_bus_volume_db(0, mute_value)
	save_settings(volume_slider.value, pressed)

func save_settings(volume, muted):
	config.set_value("audio", "volume", volume)
	config.set_value("audio", "muted", muted)
	config.save("user://settings.cfg")

func load_settings():
	var err = config.load("user://settings.cfg")
	if err == OK:
		print("Inställningar laddade!")
		var volume = config.get_value("audio", "volume", 1.0)
		var muted = config.get_value("audio", "muted", false)
		volume_slider.value = volume
		mute_checkbox.button_pressed = muted
		AudioServer.set_bus_volume_db(0, -80 if muted else linear_to_db(volume))
		


func _on_back_button_pressed() -> void:
	queue_free()
