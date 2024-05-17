extends Node2D


func _process(_delta):
	if Input.is_action_just_pressed("reload"):
		get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_area_2d_body_entered(body):
	await get_tree().create_timer(0.00001).timeout
	if body.is_in_group("player"):
		get_tree().change_scene_to_file("res://scenes/game.tscn")
