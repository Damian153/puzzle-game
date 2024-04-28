extends StaticBody2D


var player_in_area = false
var player = null

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player_in_area and Input.is_action_just_pressed("action"):
		Global.plpos = player.position
		get_tree().change_scene_to_file("res://interior/houseint.tscn")



func _on_area_2d_body_entered(body):
	if body.has_method("player"):
		player = body
		player_in_area = true


func _on_area_2d_body_exited(body):
	if body.has_method("player"):
		player_in_area = false
