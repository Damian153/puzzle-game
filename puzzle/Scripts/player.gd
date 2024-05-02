extends CharacterBody2D
@onready var playerr = $"."
@onready var animations = $AnimationPlayer
@export var speed = 200
@export var inv: Inv
var anim_direction ="down"
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
	updateAnimation()

func updateAnimation():
	if velocity.length() == 0:
		#animations.stop()
		#if anim_direction == "down":
			#animations.play("idle_" + anim_direction)
		#elif anim_direction == "up":
			#animations.play("idle_" + anim_direction)
		#elif anim_direction == "left":
			#animations.play("idle_" + anim_direction)
		#elif anim_direction == "right":
		animations.play("idle_" + anim_direction)
	else:
		if velocity.y > 0 : anim_direction = "down"
		elif velocity.x < 0 : anim_direction = "left"
		elif velocity.x > 0 : anim_direction = "right"
		elif velocity.y < 0 : anim_direction = "up"
		
		if Global.run > 1:
			animations.speed_scale = Global.run
			animations.play("move_" + anim_direction)
		else:
			animations.speed_scale = Global.run
			animations.play("move_" + anim_direction)

func player():
	pass

func collect(item):
	inv.insert(item)



