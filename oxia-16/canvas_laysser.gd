extends CanvasLayer

@onready var dialog_sprite: AnimatedSprite2D = $AnimatedSprite2D


func _ready() -> void:
	dialog_sprite.position = get_viewport().get_visible_rect().size / 2.0
	dialog_sprite.show()
