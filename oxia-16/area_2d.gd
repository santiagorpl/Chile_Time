extends Area2D

func _on_body_entered(body: PhysicsBody2D):
	get_tree().change_scene_to_file("res://loading.tscn")
