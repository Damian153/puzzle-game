extends Panel

@onready var item_visual: Sprite2D = $CenterContainer/Panel/item_display
@onready var amount_text = $CenterContainer/Panel/amount_text
@onready var plinv : Inv = preload("res://inv/playerinv.tres")
@onready var chinv : Inv = preload("res://inv/chestinv.tres")
var MouseOver= false

func update(slot: InvSlot):
	if !slot.item:
		item_visual.visible = false
		amount_text.visible = false
	else:
		item_visual.visible = true
		item_visual.texture = slot.item.texture
		if slot.amount > 1:
			amount_text.visible = true
		if slot.amount == 0:
			slot.item = null
		amount_text.text = str(slot.amount)

func _input(event):
	if event is InputEventMouseButton:
		if event.is_released() and MouseOver:
			check()

func check():
	for i in 6:
		if chinv.slots[i].item:
			#if chinv.slots[i].item.name == "coin":
			for j in range(chinv.slots[i].amount):
				plinv.insert(chinv.slots[i].item)
			chinv.slots.remove_at(i)

func _on_mouse_exited():
	MouseOver = false

func _on_mouse_entered():
	MouseOver = true
