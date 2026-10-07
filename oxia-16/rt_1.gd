extends Node2D


@onready var toko = $Toko
@onready var player = $CharacterBody2D
@onready var area_toko = $RUMAH/Area2D

var player_di_toko := false


func _ready():
	area_toko.body_entered.connect(_on_toko_body_entered)
	area_toko.body_exited.connect(_on_toko_body_exited)

	toko.toko_dibuka.connect(_on_toko_dibuka)
	toko.toko_ditutup.connect(_on_toko_ditutup)


func _process(_delta):
	if player_di_toko and Input.is_action_just_pressed("ui_accept"):
		toko.buka_toko()


func _on_toko_body_entered(body):
	if body == player:
		player_di_toko = true


func _on_toko_body_exited(body):
	if body == player:
		player_di_toko = false
		toko.tutup_toko()


func _on_toko_dibuka():
	if "toko_terbuka" in player:
		player.toko_terbuka = true


func _on_toko_ditutup():
	if "toko_terbuka" in player:
		player.toko_terbuka = false
