extends CharacterBody2D

var move_speed: float = 500.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var jalan_sound: AudioStreamPlayer = $JalanSound


func _physics_process(_delta: float) -> void:
	var direction: Vector2 = Vector2.ZERO

	# Mengambil input dari Input Map
	direction.x = (
		Input.get_action_strength("right")
		- Input.get_action_strength("left")
	)

	direction.y = (
		Input.get_action_strength("down")
		- Input.get_action_strength("up")
	)

	# Menyamakan kecepatan diagonal
	direction = direction.normalized()

	# Mengatur kecepatan karakter
	velocity = direction * move_speed

	# Menggerakkan karakter
	move_and_slide()

	# Animasi dan audio saat berjalan
	if direction != Vector2.ZERO:

		if abs(direction.x) > abs(direction.y):
			if direction.x > 0:
				animated_sprite.play("jalan_kanan")
			else:
				animated_sprite.play("jalan_kiri")
		else:
			if direction.y < 0:
				animated_sprite.play("jalan_atas")
			else:
				animated_sprite.play("jalan_bawah")

		# Putar suara tanpa memulai ulang setiap frame
		if not jalan_sound.playing:
			jalan_sound.play()

	else:
		# Animasi diam
		animated_sprite.play("diam")

		# Hentikan suara ketika karakter berhenti
		if jalan_sound.playing:
			jalan_sound.stop()
