extends Node

var run = 3
var can_collect = false
var coin :String
func _process(delta):
	if Input.is_action_just_pressed("esc"):
		get_tree().quit()