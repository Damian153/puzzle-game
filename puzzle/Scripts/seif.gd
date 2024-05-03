extends Control

@onready var up = $PanelContainer/VBoxContainer/HBoxContainer/VBoxContainer/up
@onready var down = $PanelContainer/VBoxContainer/HBoxContainer/VBoxContainer/down
@onready var cf_1 = $PanelContainer/VBoxContainer/HBoxContainer/VBoxContainer/cf1
@onready var up_3 = $PanelContainer/VBoxContainer/HBoxContainer/VBoxContainer3/up3
@onready var cf_3 = $PanelContainer/VBoxContainer/HBoxContainer/VBoxContainer3/cf3
@onready var down_3 = $PanelContainer/VBoxContainer/HBoxContainer/VBoxContainer3/down3
@onready var up_2 = $PanelContainer/VBoxContainer/HBoxContainer/VBoxContainer2/up2
@onready var cf_2 = $PanelContainer/VBoxContainer/HBoxContainer/VBoxContainer2/cf2
@onready var unlock = $PanelContainer/VBoxContainer/unlock


var cnt1 = 0
var cnt2 = 0
var cnt3 = 0
func _process(delta):
	cf_1.text = str(cnt1)
	cf_2.text = str(cnt2)
	cf_3.text = str(cnt3)
	

func _on_up_pressed():
	if cnt1 < 9 : cnt1 = cnt1 + 1
	else: cnt1 = 0

func _on_down_pressed():
	if cnt1 > 0 :cnt1 = cnt1 -1
	else: cnt1 = 9

func _on_up_2_pressed():
	if cnt2 < 9 : cnt2 = cnt2 + 1
	else: cnt2 = 0


func _on_down_2_pressed():
	if cnt2 > 0 :cnt2 = cnt2 -1
	else: cnt2 = 9


func _on_up_3_pressed():
	if cnt3 < 9 : cnt3 = cnt3 + 1
	else: cnt3 = 0

func _on_down_3_pressed():
	if cnt3 > 0 :cnt3 = cnt3 -1
	else: cnt3 = 9


func _on_unlock_pressed():
	check()

func check():
	if cnt1*cnt2*cnt3 == 15: self.queue_free()
	
func exit():
	if Input.is_action_just_pressed("action"):
		self.queue_free()
