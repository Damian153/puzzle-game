extends TileMap
@onready var inv : Inv = preload("res://inv/playerinv.tres")
@onready var slot : InvSlot
@onready var chest = $"."
@onready var unlocked = $"../unlocked"
@onready var locked = $"../locked"
@onready var impossible = $"../impossible"

var status = "locked" #unlocked
var can_unlock = false
var player_in_area = false
var poz=0
var collected = false
var player = null
var gem_collectable = preload("res://Scene/gem_collectable.tscn")
var open = false



func _ready():
	unlocked.visible = false
	impossible.visible = false

func _process(delta):
	if player_in_area :
		#var tile_ch_pos = get_used_cells_by_id(0)
		#chest.set_cell(0,tile_ch_pos[0],0,Vector2i(1,1))
		#await get_tree().create_timer(0.2).timeout
		#chest.set_cell(0,tile_ch_pos[0],0,Vector2i(1,2))
		if status == "locked":
			locked.visible = true
			if can_unlock:
				unlock()
			else:
				if Input.is_action_just_pressed("action"):
					impossible.visible = true
					await get_tree().create_timer(2).timeout
					impossible.visible = false
					locked.visible = false
		else: 
			locked.visible= false
	else:
		locked.visible = false

#
#
func unlock():
	if Input.is_action_pressed("action") :
		if inv.slots[poz].amount >= 1:
			status = "unlocked"
			unlocked.visible = true
			inv.slots[poz].amount -= 1
			
			var tile_ch_pos = get_used_cells_by_id(0)
			chest.set_cell(0,tile_ch_pos[0],0,Vector2i(1,1))
			await get_tree().create_timer(0.2).timeout
			chest.set_cell(0,tile_ch_pos[0],0,Vector2i(1,2))
			
			await get_tree().create_timer(0.5).timeout
			unlocked.visible = false
			var instance = gem_collectable.instantiate()
			add_child(instance)
#
func _on_area_2d_body_entered(body):
	if body.has_method("player"):
		player_in_area = true
		search()

func _on_area_2d_body_exited(body):
	if body.has_method("player"):
		player_in_area = false
func search():
	for i in 6:
		if inv.slots[i].item:
			if str(inv.slots[i].item.name) == "coin":
				can_unlock = true
				poz=i
