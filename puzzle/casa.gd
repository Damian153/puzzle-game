extends StaticBody2D

@onready var open_text = $open_text

var player_in_area = false
var player = null

func _ready():
	open_text.visible = false

func _process(delta):
	if player_in_area and Input.is_action_just_pressed("action"):
		get_tree().change_scene_to_file("res://interior/houseint.tscn")

func _on_area_2d_body_entered(body):
	if body.has_method("player"):
		player = body
		Global.plpos = player.position
		player_in_area = true
		open_text.visible = true


func _on_area_2d_body_exited(body):
	if body.has_method("player"):
		player_in_area = false
		open_text.visible = false
