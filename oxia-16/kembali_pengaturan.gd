extends Button

@onready var info = get_node_or_null("/root/main menu/pengaturan00")

func _ready():
	pressed.connect(_on_kembali_ditekan)

func _on_kembali_ditekan():
	if info != null:
		info.hide()
	else:
		print("Node info pengembang00 tidak ditemukan!")
