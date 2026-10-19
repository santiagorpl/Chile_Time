extends Button

@onready var info = get_node_or_null("/root/main menu/pengaturan00")

func _ready():
	hide()

	await get_tree().create_timer(5.0).timeout
	show()

	pressed.connect(_on_ditekan)

func _on_ditekan():
	if info != null:
		info.show()
	else:
		print("Node info pengembang00 tidak ditemukan")
