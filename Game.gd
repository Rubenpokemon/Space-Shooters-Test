extends Node2D

var wave = 1

#func _on_Landing_Button_pressed():
	#get_tree().change_scene("res://MotherShip.tscn")
func _ready():
	Global.in_game = "Yes"
	Global.kills = 0
	$Player_Info/Wave/Wave2.text = str(Global.wave)

func _on_Quit_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Menu.tscn")

func update_wave():
	$Player_Info/Wave/Wave2.text = str(Global.wave)
