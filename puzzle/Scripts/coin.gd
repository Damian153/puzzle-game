extends Node2D

@export var item:InvItem
var collected = false
func _on_pickable_area_body_entered(body):
	if body.has_method("player") and !collected:
		body.collect(item)
		collected = true

func _process(delta):
	if collected == true :
		visible = false

