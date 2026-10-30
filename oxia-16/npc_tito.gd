
extends AnimatedSprite2D

@onready var area = $Area2D
@onready var gambar = $gambar

func _ready():
	gambar.hide()
	area.body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.name == "Player":
		gambar.show()

func _on_button_pressed():
	gambar.hide()
