extends Button

func _ready():
	pressed.connect(_on_mulai_ditekan)

func _on_mulai_ditekan():
	get_tree().change_scene_to_file("res://desa.tscn")
