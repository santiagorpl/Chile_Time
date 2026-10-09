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
	hide()

	tutup_button.pressed.connect(_on_tutup_pressed)

	kangkung_button.pressed.connect(func():
		pilih_item("Benih Kangkung")
	)

	wortel_button.pressed.connect(func():
		pilih_item("Benih Wortel",)
		pilih_item("Benih Wortel")
	)

	kentang_button.pressed.connect(func():
		pilih_item("Benih Kentang")
	)

	jahe_button.pressed.connect(func():
		pilih_item("Benih Jahe")
	)

	bawang_vip_button.pressed.connect(func():
		pilih_item("Benih Bawang VIP")
	)

	semangka_button.pressed.connect(func():
		pilih_item("Benih Semangka")
	)


func pilih_item(nama: String):
	nama_item.text = nama


func buka_toko():
	atur_posisi_toko()
	nama_item.text = "Pilih benih"
	show()
	toko_dibuka.emit()


func tutup_toko():
	hide()
	toko_ditutup.emit()


func _on_tutup_pressed():
	tutup_toko()


func atur_posisi_toko():
	var ukuran_layar = get_viewport().get_visible_rect().size
	shop_image.position = ukuran_layar / 2.0
