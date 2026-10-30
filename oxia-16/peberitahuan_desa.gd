extends Sprite2D

func _ready():
	hide()

	# Tunggu 3 detik
	await get_tree().create_timer(4.5).timeout

	# Tampilkan gambar
	show()

	# Tunggu 1 menit 30 detik
	await get_tree().create_timer(90.0).timeout

	# Hilangkan gambar
	hide()


func _on_button_pressed():
	hide()
