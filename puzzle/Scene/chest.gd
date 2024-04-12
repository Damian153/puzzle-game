extends StaticBody2D

@onready var locked = $locked
@onready var unlocked = $unlocked
@onready var inv : Inv = preload("res://inv/playerinv.tres")
@onready var item : InvItem = preload("res://inv/Items/coin.tres")
var status = "locked" #unlocked
var player_in_area = false
var can_unlock = false
var poz

func _ready():
	locked.visible = false
	unlocked.visible = false

func _process(delta):
	if player_in_area:
		if status == "locked":
			locked.visible = true
			search()
			if can_unlock:
				unlock()
				
		else: 
			locked.visible= false
	else:
		locked.visible = false

func _on_area_2d_body_entered(body):
	if body.has_method("player"):
		player_in_area = true

func _on_area_2d_body_exited(body):
	if body.has_method("player"):
		player_in_area = false

func unlock():
	if Input.is_action_pressed("action"):
		status = "unlocked"
		unlocked.visible = true
		await get_tree().create_timer(1).timeout
		unlocked.visible = false
		#remove(inv.slots[)

func remove(slot:InvSlot):
	slot.amount -= 1

func search():
	for i in 6:
		if Global.coin == item.name: #slot.
			can_unlock = true
			var poz = i
