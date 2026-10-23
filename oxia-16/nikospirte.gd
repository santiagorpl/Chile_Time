
extends AnimatedSprite2D

func _ready() -> void:
	# Jalankan animasi NPC
	if sprite_frames != null and sprite_frames.has_animation(animation):
		play(animation)
	else:
		push_warning("Animasi NPC belum diatur di SpriteFrames.")
