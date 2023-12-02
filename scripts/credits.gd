extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	$FPSCounter_CreditsScreen.text = str(Engine.get_frames_per_second())

func _on_return_button_credits_screen_pressed():
	get_tree().change_scene_to_file("res://scenes/home.tscn")
