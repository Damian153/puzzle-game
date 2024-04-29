extends CharacterBody2D
@onready var playerr = $"."

@export var speed = 200
@export var inv: Inv
func _physics_process(delta):
	var direction = Input.get_vector("left","right","up","down")
	if Input.is_action_pressed("shift"):
		Global.run = 1.5
	else: Global.run = 1 
	if direction:
		velocity = direction * speed * Global.run
	else:
		velocity.x = 0
		velocity.y = 0
		if Global.exited == true:
			playerr.position = Global.plpos
			Global.exited = false
	move_and_slide()


func player():
	pass

func collect(item):
	inv.insert(item)



