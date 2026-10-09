extends Sprite2D

var kecepatan = 150.0

func _process(delta):
	position.y -= kecepatan * delta
