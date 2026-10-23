extends AnimatedSprite2D

@onready var area: Area2D = get_node_or_null("Area2D")
@onready var panel_foto: Control = get_node_or_null(
    "/root/dunia2/Lantai/CanvasLayer/Frame"
)

func _ready():
	if area == null:
		push_error("Area2D tidak ditemukan!")
		return

	if panel_foto == null:
		push_error("Frame tidak ditemukan! Periksa path CanvasLayer.")
		return

	panel_foto.hide()

	area.body_entered.connect(_on_body_entered)
	area.body_exited.connect(_on_body_exited)


func _on_body_entered(body):
	if body.is_in_group("player"):
		panel_foto.show()


func _on_body_exited(body):
	if body.is_in_group("player"):
		panel_foto.hide()
