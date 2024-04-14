extends StaticBody2D

@onready var locked = $locked
@onready var unlocked = $unlocked
@onready var inv : Inv = preload("res://inv/playerinv.tres")
@onready var impossible = $impossible
@onready var slot : InvSlot 
var status = "locked" #unlocked
var player_in_area = false
var can_unlock = false
var poz=0

func _ready():
	locked.visible = false
	unlocked.visible = false
	impossible.visible = false

func _process(delta):
	if player_in_area:
		if status == "locked":
			locked.visible = true
			if can_unlock:
				unlock()
			else:
				if Input.is_action_just_pressed("action"):
					impossible.visible = true
					await get_tree().create_timer(2).timeout
					impossible.visible = false
		else: 
			locked.visible= false
	else:
		locked.visible = false

func _on_area_2d_body_entered(body):
	if body.has_method("player"):
		player_in_area = true
		search()

func _on_area_2d_body_exited(body):
	if body.has_method("player"):
		player_in_area = false

func unlock():
	if Input.is_action_pressed("action") :
		if inv.slots[poz].amount >= 1:
			status = "unlocked"
			unlocked.visible = true
			inv.slots[poz].amount -= 1
			await get_tree().create_timer(1).timeout
			unlocked.visible = false

func search():
	for i in 6:
		if inv.slots[i].item:
			if str(inv.slots[i].item.name) == Global.coin:
				can_unlock = true
				poz=i
