extends AudioStreamPlayer

func _ready():
	var savefile = FileAccess.open('user://settings.dat', FileAccess.READ)
	var _settings = savefile.get_var()
	var volumedb = int(20*log(_settings.music_volume/100))
