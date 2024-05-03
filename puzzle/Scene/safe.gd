extends StaticBody2D
@onready var seif = $CanvasLayer/seif

var player_in_area = false
var open = false


func _process(delta):
	if player_in_area:
		if Input.is_action_just_pressed("action"):
			seif.visible = true
			open = true 
		if open and Input.is_action_just_pressed("action"):
			seif.visible = false
			open = false

func _on_area_2d_body_entered(body):
	if body.has_method("player"):
		player_in_area = true

func _on_area_2d_body_exited(body):
	if body.has_method("player"):
		player_in_area = false
