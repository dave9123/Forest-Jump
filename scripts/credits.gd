extends Control

func _ready():
	var savefile = FileAccess.open("user://settings.dat", FileAccess.READ)
	var _settings = savefile.get_var()
	$audioplayer.volume_db = int(20*log(_settings.music_volume/100))
	savefile.close()

func _process(_delta):
	$FPSCounter_CreditsScreen.text = str(Engine.get_frames_per_second())

func _on_return_button_credits_screen_pressed():
	get_tree().change_scene_to_file("res://scenes/home.tscn")
