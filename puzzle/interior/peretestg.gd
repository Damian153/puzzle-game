extends StaticBody2D


@onready var peretestanga = $peretestanga

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body.has_method("player"):
		peretestanga.modulate = "ffffff30"


func _on_area_2d_body_exited(body):
	if body.has_method("player"):
		peretestanga.modulate = "ffffffff"
