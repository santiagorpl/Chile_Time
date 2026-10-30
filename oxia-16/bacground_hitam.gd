extends Label

func _ready():
	visible = false
	await get_tree().create_timer(7.6).timeout
	visible = true
