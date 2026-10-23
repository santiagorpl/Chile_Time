
extends Area2D

const PPAKW_SCENE: PackedScene = preload("res://text_niko.tscn")

var player_di_area: bool = false
var percakapan_aktif: Node = null


func _ready() -> void:
	print("Area NPC aktif!")

	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)


func _process(_delta: float) -> void:
	# Tekan E untuk membuka percakapan lagi
	if player_di_area and Input.is_action_just_pressed("interact"):
		buka_percakapan()


func _on_body_entered(body: Node2D) -> void:
	if not body.is_in_group("Player"):
		return

	player_di_area = true
	print("Player masuk area NPC")

	# Buka otomatis saat Player masuk
	buka_percakapan()


func _on_body_exited(body: Node2D) -> void:
	if not body.is_in_group("Player"):
		return

	player_di_area = false
	print("Player keluar area NPC")


func buka_percakapan() -> void:
	# Jangan membuat percakapan ganda
	if is_instance_valid(percakapan_aktif):
		return

	percakapan_aktif = PPAKW_SCENE.instantiate()
	get_tree().current_scene.add_child(percakapan_aktif)

	# Reset ketika scene percakapan dihapus
	percakapan_aktif.tree_exited.connect(
		_on_percakapan_ditutup,
		CONNECT_ONE_SHOT
	)


func _on_percakapan_ditutup() -> void:
	percakapan_aktif = null
	print("Percakapan ditutup, bisa dibuka lagi!")
