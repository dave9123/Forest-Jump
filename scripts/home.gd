extends Control

func _ready():
	var savefile = FileAccess.open("users://settings.dat",FileAccess.WRITE_READ)
	var _settings = {fullscreen = false, vsync = true, fps_limit = 30}
	savefile.store_string(_settings)
	savefile.close()

func _process(_delta):
	$FPSCounter_HomeScreen.text = str(Engine.get_frames_per_second())

func _on_start_button_home_screen_pressed():
	pass

func _on_settings_button_home_screen_pressed():
	get_tree().change_scene_to_file("res://scenes/settings.tscn")

func _on_credits_button_home_screen_pressed():
	get_tree().change_scene_to_file("res://scenes/credits.tscn")
