extends Node2D


func _ready():
	pass

func _process(delta):
	print($CharacterBody2D.position)
	if Input.is_action_just_pressed("reload"):
		get_tree().change_scene_to_file("res://scenes/game.tscn")
