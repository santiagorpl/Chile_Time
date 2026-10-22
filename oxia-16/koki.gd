extends CharacterBody2D

@onready var animasi = $AnimatedSprite2D

func _ready():
	animasi.play("idle")
