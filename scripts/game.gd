extends Node2D

func _ready():
	var savefile = FileAccess.open("user://settings.dat", FileAccess.READ)
	var _settings = savefile.get_var()
	$audioplayer.volume_db = int(20*log(_settings.music_volume/100))
	savefile.close()

func _process(delta):
	print($CharacterBody2D.position)
	if Input.is_action_just_pressed("reload"):
		get_tree().change_scene_to_file("res://scenes/game.tscn")
