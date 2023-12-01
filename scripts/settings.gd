extends Control

var _settings := {fullscreen = false, vsync = true, fps_limit = 30}


func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_return_button_settings_screen_pressed():
	get_tree().change_scene_to_file("res://scenes/home.tscn")

func _on_v_sync_checkbox_settings_screen_toggled(button_pressed):
	_settings.vsync = button_pressed
	print("VSync is set to " + button_pressed)

func _on_full_screen_checkbox_settings_screen_toggled(button_pressed):
	_settings.fullscreen = button_pressed
	print("Full screen is set to " + button_pressed)
