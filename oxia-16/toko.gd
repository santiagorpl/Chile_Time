extends CanvasLayer


signal toko_dibuka
signal toko_ditutup


@onready var shop_image = $TokoUI/ShopImage
@onready var nama_item = $TokoUI/NamaItem
@onready var tutup_button = $TokoUI/TutupButton

@onready var kangkung_button = $TokoUI/KangkungButton
@onready var wortel_button = $TokoUI/WortelButton
@onready var kentang_button = $TokoUI/KentangButton
@onready var jahe_button = $TokoUI/JaheButton
@onready var bawang_vip_button = $TokoUI/BawangVIPButton
@onready var semangka_button = $TokoUI/SemangkaButton


func _ready():
	# Toko tidak terlihat saat game dimulai
	hide()

	# Tombol tutup
	tutup_button.pressed.connect(_on_tutup_pressed)

	# Tombol sayuran
	kangkung_button.pressed.connect(func():
		pilih_item("Benih Kangkung", kangkung_button)
	)

	wortel_button.pressed.connect(func():
		pilih_item("Benih Wortel", wortel_button)
	)

	kentang_button.pressed.connect(func():
		pilih_item("Benih Kentang", kentang_button)
	)

	jahe_button.pressed.connect(func():
		pilih_item("Benih Jahe", jahe_button)
	)

	bawang_vip_button.pressed.connect(func():
		pilih_item("Benih Bawang VIP", bawang_vip_button)
	)

	semangka_button.pressed.connect(func():
		pilih_item("Benih Semangka", semangka_button)
	)


func buka_toko():
	# Pastikan toko berada di tengah layar
	atur_posisi_toko()

	# Reset pilihan ketika toko dibuka
	reset_pilihan()

	# Tampilkan toko
	show()

	# Kirim signal
	toko_dibuka.emit()


func tutup_toko():
	# Sembunyikan toko
	hide()

	# Kirim signal
	toko_ditutup.emit()


func _on_tutup_pressed():
	tutup_toko()


func pilih_item(nama: String, tombol: Button):
	# Tampilkan nama item di kotak atas
	nama_item.text = nama

	# Kembalikan semua item ke warna normal
	kangkung_button.modulate = Color.WHITE
	wortel_button.modulate = Color.WHITE
	kentang_button.modulate = Color.WHITE
	jahe_button.modulate = Color.WHITE
	bawang_vip_button.modulate = Color.WHITE
	semangka_button.modulate = Color.WHITE

	# Buat item yang dipilih menjadi lebih gelap
	tombol.modulate = Color(0.65, 0.65, 0.65)


func reset_pilihan():
	# Teks awal
	nama_item.text = "Pilih benih"

	# Semua item kembali normal
	kangkung_button.modulate = Color.WHITE
	wortel_button.modulate = Color.WHITE
	kentang_button.modulate = Color.WHITE
	jahe_button.modulate = Color.WHITE
	bawang_vip_button.modulate = Color.WHITE
	semangka_button.modulate = Color.WHITE


func atur_posisi_toko():
	# Ambil ukuran layar/game viewport
	var ukuran_layar = get_viewport().get_visible_rect().size

	# Letakkan gambar toko tepat di tengah layar
	shop_image.position = ukuran_layar / 2.0
