extends Area2D

const PPAKW_SCENE: PackedScene = preload("res://PpakW.tscn")

var sudah_muncul: bool = false


func _ready() -> void:
	print("Area1 aktif!")
	body_entered.connect(_on_body_entered)


func _on_body_entered(body: Node2D) -> void:
	print("Area mendeteksi: ", body.name)

	if sudah_muncul:
		return

	# Nama grup harus sama persis dengan grup di screenshot: Player
	if not body.is_in_group("Player"):
		return

	var percakapan = PPAKW_SCENE.instantiate()

	# Masukkan scene percakapan ke scene utama
	get_tree().current_scene.add_child(percakapan)

	sudah_muncul = true
	set_deferred("monitoring", false)

	print("PpakW.tscn berhasil dimunculkan!")
