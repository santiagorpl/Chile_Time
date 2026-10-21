extends AnimatedSprite2D

var jumlah_klik: int = 0


func _ready() -> void:
	# Hentikan animasi otomatis
	stop()

	# Mulai dari frame pertama
	frame = 0
	show()


func _input(event: InputEvent) -> void:
	# Jangan proses klik jika sprite sudah tidak terlihat
	if not visible:
		return

	# Hanya menerima klik kiri mouse
	if not (event is InputEventMouseButton):
		return

	if event.button_index != MOUSE_BUTTON_LEFT:
		return

	if not event.pressed:
		return

	# Pastikan SpriteFrames tersedia
	if sprite_frames == null:
		return

	# Ambil tekstur frame saat ini
	var texture: Texture2D = sprite_frames.get_frame_texture(
		animation,
		frame
	)

	if texture == null:
		return

	# Hitung area sprite
	var ukuran: Vector2 = texture.get_size()
	var area_sprite: Rect2

	if centered:
		area_sprite = Rect2(
			offset - ukuran / 2.0,
			ukuran
		)
	else:
		area_sprite = Rect2(
			offset,
			ukuran
		)

	# Posisi mouse dalam koordinat lokal sprite
	var posisi_mouse: Vector2 = to_local(
		get_global_mouse_position()
	)

	# Abaikan klik di luar gambar sprite
	if not area_sprite.has_point(posisi_mouse):
		return

	# Hitung klik
	jumlah_klik += 1
	print("Jumlah klik: ", jumlah_klik)

	# Klik ketiga: sembunyikan sprite dan gelap
	if jumlah_klik >= 3:
		hide()

		# Cari node gelap pada parent PpakW
		var gelap_node: Node = get_parent().get_node_or_null("gelap")

		if gelap_node != null:
			gelap_node.hide()
			print("Node gelap berhasil disembunyikan!")
		else:
			print("Node gelap tidak ditemukan!")

		get_viewport().set_input_as_handled()
		return

	# Klik pertama dan kedua: ganti ke frame berikutnya
	var total_frame: int = sprite_frames.get_frame_count(
		animation
	)

	if total_frame > 0:
		frame = (frame + 1) % total_frame

	get_viewport().set_input_as_handled()
