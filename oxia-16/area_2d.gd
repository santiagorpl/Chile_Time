extends Area2D

var player_inside := false


func _on_body_entered(body):
	if body is CharacterBody2D:
		player_inside = true


func _on_body_exited(body):
	if body is CharacterBody2D:
		player_inside = false


func _process(_delta):
	if player_inside and Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene_to_file("res://toko.tscn")
