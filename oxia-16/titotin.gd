
extends AnimatedSprite2D

var jumlah_klik: int = 0


func _ready() -> void:
	# Hentikan animasi otomatis
	stop()

	# Mulai dari frame pertama
	frame = 0
	jumlah_klik = 0
	show()


func _input(event: InputEvent) -> void:
	# Abaikan klik jika sprite tidak terlihat
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

	if not sprite_frames.has_animation(animation):
		return

	var total_frame: int = sprite_frames.get_frame_count(animation)

	if total_frame <= 0:
		return

	# Ambil tekstur frame saat ini
	var texture: Texture2D = sprite_frames.get_frame_texture(
		animation,
		frame
	)

	if texture == null:
		return

	# Tentukan area sprite
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

	jumlah_klik += 1
	print("Jumlah klik: ", jumlah_klik)

	# Jika belum mencapai frame terakhir,
	# pindah ke frame berikutnya
	if frame < total_frame - 1:
		frame += 1

		get_viewport().set_input_as_handled()
		return

	# Frame terakhir diklik: tutup percakapan
	var parent_node: Node = get_parent()

	if parent_node != null:
		# Sembunyikan node gelap jika tersedia
		var gelap_node: Node = parent_node.get_node_or_null("gelap")

		if gelap_node is CanvasItem:
			(gelap_node as CanvasItem).hide()
			print("Node gelap disembunyikan!")

		# Hapus seluruh scene percakapan
		parent_node.queue_free()
		print("Percakapan ditutup!")

	get_viewport().set_input_as_handled()
