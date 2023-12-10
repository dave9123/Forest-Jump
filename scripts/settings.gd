extends Control

var _settings := {play_music = true, music_volume = 100}

func _ready():
	if FileAccess.file_exists("user://settings.dat"):
		print("[!] Settings file exists.")
		print("[/] Setting settings to file...")
		var settingsfile = FileAccess.open("user://settings.dat", FileAccess.READ_WRITE)
		_settings = settingsfile.get_var()
		print("[/] Set settings to file!")
	elif not FileAccess.file_exists("user://settings.dat"):
		print("[/] Settings file doesn't exists.")
		print("[/] Using default configuration instead.")
		print("[/] Storing settings file...")
		var settingsfile = FileAccess.open("user://settings.dat", FileAccess.WRITE_READ)
		settingsfile.store_var(_settings)
		settingsfile.close()
		print("[/] Set variable _settings from file!")
		print("[/] Setting up default values...")
	$MusicVolumeSlider_SettingsScreen.value = int(_settings.music_volume)
	$MusicVolumeTextBox_SettingsScreen.text = str(_settings.music_volume)

func save_settings():
	print("save_settings function called")
	var savefile = FileAccess.open("user://settings.dat", FileAccess.WRITE)
	savefile.store_var(_settings)
	savefile.close()

func _process(_delta):
	$FPSCounter_SettingsScreen.text = str(Engine.get_frames_per_second())

func _on_return_button_settings_screen_pressed():
	get_tree().change_scene_to_file("res://scenes/home.tscn")

func _on_music_volume_text_box_settings_screen_text_changed(value):
	if int(value) < 0:
		print("[!] Invalid value!")
		$MusicVolumeTextBox_SettingsScreen.text = str(0)
		$MusicVolumeSlider_SettingsScreen.value = int(0)
		_settings.music_volume = int(value)
	elif int(value) > 100:
		print("[!] Invalid value!")
		$MusicVolumeTextBox_SettingsScreen.text = str(100)
		$MusicVolumeSlider_SettingsScreen.value = int(100)
		_settings.music_volume = int(value)
	else:
		_settings.music_volume = int(value)
		$MusicVolumeSlider_SettingsScreen.value = int(value)
		print("Percentage: ",_settings.music_volume," dB: ",20*log(_settings.music_volume/100))
		save_settings()

func _on_music_volume_slider_settings_screen_value_changed(value):
	if int(value) < 0:
		print("[!] Invalid value!")
		$MusicVolumeTextBox_SettingsScreen.text = str(0)
		$MusicVolumeSlider_SettingsScreen.value = int(0)
		_settings.music_volume = int(value)
	elif int(value) > 100:
		print("[!] Invalid value!")
		$MusicVolumeTextBox_SettingsScreen.text = str(100)
		$MusicVolumeSlider_SettingsScreen.value = int(100)
		_settings.music_volume = int(value)
	else:
		_settings.music_volume = int(value)
		$MusicVolumeTextBox_SettingsScreen.text = str(value)
		$audioplayer.volume_db = int(20*log(int(_settings.music_volume)/100))
		print("Percentage: ",_settings.music_volume," dB: ",20*log(_settings.music_volume/100))
		save_settings()
