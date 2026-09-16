extends CharacterBody2D

var move_speed : float = 500.0

@onready var animated_sprite : AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(_delta):
	var direction : Vector2 = Vector2.ZERO

	# Mengambil input dari tombol yang sudah di-setting di Input Map
	direction.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	direction.y = Input.get_action_strength("down") - Input.get_action_strength("up")

	# Normalisasi agar kecepatan diagonal sama
	direction = direction.normalized()

	# Mengatur kecepatan pergerakan
	velocity = direction * move_speed

	# Jalankan pergerakan karakter
	move_and_slide()

	# Mengatur animasi berdasarkan arah gerak
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
	else:
		# Berhenti putar animasi kalau tombol dilepas
		animated_sprite.stop()
