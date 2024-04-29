extends StaticBody2D

@onready var pereteusa = $pereteusa

var player_in_area = false
var player = null
func _process(delta):
	if player_in_area and Input.is_action_just_pressed("action"):
		get_tree().change_scene_to_file("res://Scene/level1.tscn")
		Global.exited = true

func _on_area_2d_body_entered(body):
	if body.has_method("player"):
		player = body
		pereteusa.modulate = "ffffff30"

func _on_area_2d_body_exited(body):
	if body.has_method("player"):
		pereteusa.modulate = "ffffffff"



func _on_iesire_body_entered(body):
	if body.has_method("player"):
		player_in_area = true

func _on_iesire_body_exited(body):
	if body.has_method("player"):
		player_in_area = false
