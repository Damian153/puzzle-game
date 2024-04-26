extends Control

@onready var inv: Inv = preload("res://inv/playerinv.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()

var is_open = false 

func _ready():
	inv.update.connect(update_slots)
	self.visible =true

func update_slots():
	for i in range(min(inv.slots.size(), slots.size())):
		slots[i].update(inv.slots[i])

func _process(delta):
	update_slots()
