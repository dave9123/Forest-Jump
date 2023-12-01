extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	var _settings := {fullscreen = false, vsync = true, fps_limit = 30}
	if FileAccess.file_exists("user://settings.dat"):
		print("File doesn't exists")
	var savefile = FileAccess.open("user://settings.dat", FileAccess.WRITE_READ)
	savefile.store_string("hi")

func _process(_delta):
	pass
	#print(Engine.get_frames_per_second())

func _on_start_button_home_screen_pressed():
	pass

func _on_settings_button_home_screen_pressed():
	get_tree().change_scene_to_file("res://scenes/settings.tscn")

func _on_credits_button_home_screen_pressed():
	get_tree().change_scene_to_file("res://scenes/credits.tscn")
