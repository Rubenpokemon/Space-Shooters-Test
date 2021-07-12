extends Control



func _ready():

	Global.in_game = "No"

	if Global.win == "Yes":
		$Lose.hide()
		Global.spending += Global.reward 
		$Win/Reward_Number.text = str(Global.reward)

	if Global.win == "No":
		$Win.hide()
		$"Lose/Losing Wave Number".text = str(Global.wave)
		if Global.wave != 1:
			$Lose/Reward_Number.text = str(round((Global.reward/5)*Global.wave))
			Global.spending +=  round(Global.reward/5*Global.wave)
			print (Global.spending)
		else:
			$Lose/Reward_Number.text = "0"
			Global.spending += 0

func _on_Quit_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Menu.tscn")
