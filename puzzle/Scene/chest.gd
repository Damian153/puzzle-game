extends StaticBody2D

@onready var locked = $locked
@onready var unlocked = $unlocked
@onready var inv : Inv = preload("res://inv/playerinv.tres")
@onready var item : InvItem #= preload("res://inv/Items/coin.tres")
@onready var slot : InvSlot 
var status = "locked" #unlocked
var player_in_area = false
var can_unlock = false
var poz=0
#var upd = Inv_UI.new()

func _ready():
	locked.visible = false
	unlocked.visible = false

func _process(delta):
	if player_in_area:
		if status == "locked":
			locked.visible = true
			#search()
			if can_unlock:
				unlock()
				
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
	if Input.is_action_pressed("action"):
		status = "unlocked"
		unlocked.visible = true
		inv.slots[poz].amount -= 1
		await get_tree().create_timer(1).timeout
		unlocked.visible = false
		

func search():
	for i in 6:
		if inv.slots[i].item:
			if str(inv.slots[i].item.name)== Global.coin:
				can_unlock = true
				poz=i
				print(str(inv.slots[i].item.name))
				print(str(inv.slots[i].amount))
