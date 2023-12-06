extends Control

var _settings = {}
const forceSetSettings = true

func _ready():
	print("[!] Force set settings is curently set to ", forceSetSettings, "!")
	if not FileAccess.file_exists("user://settings.dat"):
		var savefile = FileAccess.open("user://settings.dat", FileAccess.WRITE_READ)
		var _settings := {play_music = true, music_volume = 100}
		savefile.store_var(_settings)		

func _process(_delta):
	$FPSCounter_HomeScreen.text = str(Engine.get_frames_per_second())

func _on_start_button_home_screen_pressed():
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func _on_settings_button_home_screen_pressed():
	get_tree().change_scene_to_file("res://scenes/settings.tscn")

func _on_credits_button_home_screen_pressed():
	get_tree().change_scene_to_file("res://scenes/credits.tscn")
