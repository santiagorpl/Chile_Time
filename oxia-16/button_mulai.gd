extends Button

func _ready():
	visible = false
	await get_tree().create_timer(5.0).timeout
	visible = true
