extends Node

var run = 3
var can_collect = false
var coin :String
var remove = false
var open = false
var show_inv = false
var plpos :Vector2
var slots : Array
var exited = false
func _process(delta):
	if Input.is_action_just_pressed("esc"):
		get_tree().quit()
