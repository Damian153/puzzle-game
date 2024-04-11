extends Node

var run = 3
func _process(delta):
	if Input.is_action_just_pressed("esc"):
		get_tree().quit()
