extends Control

var _settings := {fullscreen = false, vsync = true, fps_limit = 30}

func _ready():
	print("Ready!")
	var savefile = FileAccess.open("users://settings.dat",FileAccess.WRITE_READ)
	if not FileAccess.file_exists("users://settings.dat"):
		print("Settings file not found, using default settings.")
		
	elif FileAccess.file_exists("users://settings.dat"):
		print("Settings file exists, using it.")
		_settings = str_to_var(savefile.get_as_text())
		assert(typeof(_settings) == TYPE_DICTIONARY)

func save_settings():
	print("save_settings function called")
	var savefile = FileAccess.open("users://settings.dat", FileAccess.WRITE)
	savefile.store_string(var_to_str(_settings))

func _process(_delta):
	pass

func _on_return_button_settings_screen_pressed():
	get_tree().change_scene_to_file("res://scenes/home.tscn")

func _on_v_sync_checkbox_settings_screen_toggled(button_pressed):
	_settings.vsync = button_pressed
	print(str("VSync is set to ", button_pressed))
	save_settings()

func _on_full_screen_checkbox_settings_screen_toggled(button_pressed):
	_settings.fullscreen = button_pressed
	print(str("Full screen is set to ", button_pressed))
	save_settings()
