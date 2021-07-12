extends Control



func _on_Quit_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Menu.tscn")


func _on_Quest_1_pressed():
	Global.reward = $Quest_1.reward
	Global.stars = $Quest_1.stars
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Game.tscn")


func _on_Refresh_pressed():
	$Quest_1.refresh()
	$Quest_2.refresh()
	$Quest_3.refresh()
	$Quest_4.refresh()
	$Quest_5.refresh()


func _on_Quest_2_pressed():
	Global.reward = $Quest_2.reward
	Global.stars = $Quest_2.stars
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Game.tscn")

func _on_Quest_3_pressed():
	Global.reward = $Quest_3.reward
	Global.stars = $Quest	_3.stars
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Game.tscn")

func _on_Quest_4_pressed():
	Global.reward = $Quest_4.reward
	Global.stars = $Quest_4.stars
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Game.tscn")

func _on_Quest_5_pressed():
	Global.reward = $Quest_5.reward
	Global.stars = $Quest_5.stars
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Game.tscn")
