extends Node2D

@export var item:InvItem
func _on_pickable_area_body_entered(body):
	if body.has_method("player"):
		body.collect(item)
		Global.coin = "coin"
		self.queue_free()
