extends Node2D

func _process(_delta):
	$FPSCounter_ControlsScreen.text = str(Engine.get_frames_per_second())

func _on_return_button_controls_screen_pressed():
	get_tree().change_scene_to_file("res://scenes/home.tscn")
