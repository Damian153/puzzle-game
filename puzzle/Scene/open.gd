extends Label

var player_in_area = false

func _on_static_body_2d_sts():
	toggle()

func toggle():
	if player_in_area and !Global.open:
		self.visible = true
	else:
		self.visible = false

func _on_area_2d_body_entered(body):
	if body.has_method("player"):
		player_in_area = true

func _on_area_2d_body_exited(body):
	if body.has_method("player"):
		player_in_area = false
