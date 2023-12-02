extends Control
var _settings = {}
func _ready():
	if FileAccess.file_exists("user://settings.dat"):
		print("[!] Settings file doesn't exists.")
		print("[/] Setting settings file to default configuration...")
		_settings = {fullscreen = false, vsync = true, fps_limit = 30}
		var settingsfile = FileAccess.open("user://settings.dat",FileAccess.WRITE_READ)
		settingsfile.store_var(_settings)
		settingsfile.close()
	elif not FileAccess.file_exists("user://settings.dat"):
		print("[/] Settings file exists.")


func _process(_delta):
	$FPSCounter_HomeScreen.text = str(Engine.get_frames_per_second())

func _on_start_button_home_screen_pressed():
	pass

func _on_settings_button_home_screen_pressed():
	get_tree().change_scene_to_file("res://scenes/settings.tscn")

func _on_credits_button_home_screen_pressed():
	get_tree().change_scene_to_file("res://scenes/credits.tscn")
