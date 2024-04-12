extends StaticBody2D

@export var item : InvItem
var player = null
var player_in_area = false
@onready var collect_text = $collect_text
func _process(delta):
	collect_text.visible = false
	if player_in_area :
		collect_text.visible = true
		playercollect()
	else:
		collect_text.visible = false

func _on_interactable_area_body_entered(body):
	if body.has_method("player"):
		player = body
		player_in_area = true

func _on_interactable_area_body_exited(body):
	if body.has_method("player"):
		player_in_area = false

func playercollect():
	if Input.is_action_just_pressed("action"):
		player.collect(item)
		self.queue_free()


