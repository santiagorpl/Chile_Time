
extends Control

var arah := Vector2.ZERO
var sedang_digeser := false
var posisi_jempol := Vector2.ZERO

const JARI_JOYSTICK := 24.0
const JARI_LINGKARAN := 58.0
const JARAK_MAKSIMAL := 30.0

func _ready():
	custom_minimum_size = Vector2(140, 140)
	size = Vector2(140, 140)
	set_anchors_preset(Control.PRESET_BOTTOM_LEFT)
	position = Vector2(30, -170)
	mouse_filter = Control.MOUSE_FILTER_STOP
	posisi_jempol = size / 2
	queue_redraw()

func _draw():
	var tengah = size / 2

	draw_circle(
		tengah,
		JARI_JOYSTICK + JARAK_MAKSIMAL,
		Color(1, 1, 1, 0.25)
	)

	draw_arc(
		tengah,
		JARI_LINGKARAN,
		0,
		TAU,
		48,
		Color.WHITE,
		3.0
	)

	draw_circle(
		tengah + arah * JARAK_MAKSIMAL,
		JARI_JOYSTICK,
		Color.WHITE
	)

	draw_arc(
		tengah + arah * JARAK_MAKSIMAL,
		JARI_JOYSTICK,
		0,
		TAU,
		32,
		Color.BLACK,
		2.0
	)

func _gui_input(event):
	if event is InputEventScreenTouch:
		sedang_digeser = event.pressed
		if sedang_digeser:
			gerakkan_joystick(event.position)
		else:
			arah = Vector2.ZERO
			queue_redraw()
		accept_event()

	elif event is InputEventScreenDrag:
		gerakkan_joystick(event.position)
		accept_event()

	elif event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			sedang_digeser = event.pressed
			if sedang_digeser:
				gerakkan_joystick(event.position)
			else:
				arah = Vector2.ZERO
				queue_redraw()
			accept_event()

	elif event is InputEventMouseMotion and sedang_digeser:
		gerakkan_joystick(event.position)
		accept_event()

func gerakkan_joystick(posisi: Vector2):
	var tengah = size / 2
	var selisih = posisi - tengah

	arah = selisih.limit_length(JARAK_MAKSIMAL)
	arah = arah / JARAK_MAKSIMAL

	queue_redraw()
