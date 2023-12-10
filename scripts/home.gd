extends Control

#var _settings = {}
#const forceSetSettings = true

func _ready():
	var savefile = FileAccess.open("user://settings.dat", FileAccess.READ)
	var _settings = savefile.get_var()
	$audioplayer.volume_db = int(20*log(_settings.music_volume/100))
	savefile.close()

func _process(_delta):
	$FPSCounter_HomeScreen.text = str(Engine.get_frames_per_second())

func _on_start_button_home_screen_pressed():
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func _on_settings_button_home_screen_pressed():
	get_tree().change_scene_to_file("res://scenes/settings.tscn")

func _on_credits_button_home_screen_pressed():
	get_tree().change_scene_to_file("res://scenes/credits.tscn")
