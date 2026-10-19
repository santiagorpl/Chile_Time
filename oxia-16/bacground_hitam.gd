extends Label

func _ready():
	visible = false
	await get_tree().create_timer(8.0).timeout
	visible = true
