
extends Area2D

@export_file("*.tscn") var tujuan_ruangan: String = "res://cafe_buk_ana.tscn"

var pemain_dekat := false

func _ready():
	body_entered.connect(_saat_masuk)
	body_exited.connect(_saat_keluar)
	print("PINTU AKTIF")

func _saat_masuk(body):
	if body.is_in_group("player"):
		pemain_dekat = true
		print("Pemain dekat pintu")

func _saat_keluar(body):
	if body.is_in_group("player"):
		pemain_dekat = false

func _process(_delta):
	if pemain_dekat and Input.is_action_just_pressed("ui_accept"):
		print("Tombol masuk ditekan")

		if ResourceLoader.exists(tujuan_ruangan):
			print("Scene ditemukan: ", tujuan_ruangan)
			var hasil = get_tree().change_scene_to_file(tujuan_ruangan)

			if hasil != OK:
				print("Gagal pindah scene. Kode error: ", hasil)
		else:
			print("Scene tidak ditemukan: ", tujuan_ruangan)
