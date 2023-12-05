extends Control

var _settings := {vsync = false, fps_limit = 30, music_volume = 100}

func _ready():
	if FileAccess.file_exists("user://settings.dat"):
		print("[!] Settings file exists.")
		print("[/] Setting settings to file...")
		var settingsfile = FileAccess.open("user://settings.dat", FileAccess.READ_WRITE)
		_settings = settingsfile.get_var()
		print("[/] Set settings to file!")
		settingsfile.close()
		#if _settings.vsync = true:
		#	DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED)
		#elif _settings.vsync = false:
		#	DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
	elif not FileAccess.file_exists("user://settings.dat"):
		print("[/] Settings file doesn't exists.")
		print("[/] Using default configuration instead.")
		_settings = {fullscreen = false, vsync = true, fps_limit = 30}
		print("[/] Storing settings file...")
		var settingsfile = FileAccess.open("user://settings.dat", FileAccess.WRITE_READ)
		settingsfile.store_var(_settings)
		settingsfile.close()
		print("[/] Set variable _settings from file!")
		print("[/] Setting up default values...")
		$MusicVolumeSlider_SettingsScreen.value = _settings.music_volume
		$MusicVolumeTextBox_SettingsScreen.text = _settings.music_volume
		$AudioStreamPlayer2D.autoplay = true
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)

func save_settings():
	print("save_settings function called")
	var savefile = FileAccess.open("users://settings.dat", FileAccess.WRITE)
	savefile.store_var(_settings)

func _process(_delta):
	$FPSCounter_SettingsScreen.text = str(Engine.get_frames_per_second())

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

func _on_music_volume_text_box_settings_screen_text_changed(value):
	if int(value) < 0:
		print("[!] Invalid value!")
		#Set to previous value
	elif int(value) > 100:
		print("[!] Invalid value!")
		#Set to previous value
	else:
		_settings.music_volume = int(value)
		$MusicVolumeSlider_SettingsScreen.value = int(value)
		$AudioStreamPlayer2D.volume_db = ""

func _on_music_volume_slider_settings_screen_value_changed(value):
	if int(value) < 0:
		print("[!] Invalid value!")
		#Set to previous value
	elif int(value) > 100:
		print("[!] Invalid value!")
		#Set to previous value
	else:
		_settings.music_volume = int(value)
		$MusicVolumeTextBox_SettingsScreen.text = str(value)
