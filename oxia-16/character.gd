
extends CharacterBody2D

var move_speed: float = 500.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var jalan_sound: AudioStreamPlayer = $JalanSound
@onready var joystick = get_node_or_null("../CanvasLayer/Joystick")

func _physics_process(_delta: float) -> void:
	var direction := Vector2.ZERO

	# Input keyboard
	direction.x = (
		Input.get_action_strength("right")
		- Input.get_action_strength("left")
	)

	direction.y = (
		Input.get_action_strength("down")
		- Input.get_action_strength("up")
	)

	# Input joystick HP
	if joystick != null and joystick.arah.length() > 0.1:
		direction = joystick.arah

	# Samakan kecepatan diagonal
	direction = direction.normalized()

	# Gerakkan karakter dengan sistem fisika Godot
	velocity = direction * move_speed
	move_and_slide()

	# Animasi dan suara
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

		if not jalan_sound.playing:
			jalan_sound.play()
	else:
		animated_sprite.play("diam")

		if jalan_sound.playing:
			jalan_sound.stop()
