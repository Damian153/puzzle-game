extends Node2D

@export var item : InvItem
var player = null
var player_in_area = false

func _process(delta):
	if player_in_area :
		playercollect()

func playercollect():
	player.collect(item)
	self.queue_free()



func _on_pickable_area_body_entered(body):
	if body.has_method("player"):
		player = body
		player_in_area = true


func _on_pickable_area_body_exited(body):
	if body.has_method("player"):
		player_in_area = false
