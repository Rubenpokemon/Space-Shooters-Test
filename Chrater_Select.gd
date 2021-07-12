extends Control

onready var text = $Ability/Ability_Text

func _ready():
	$AnimationPlayer.play("Arrow")
	if Global.charater == 0:
		$Arrow.position.x = 611
		text.text = "Repair"
	elif Global.charater == 1:
		$Arrow.position.x = 0
		text.text = "Wither"
	else:
		$Arrow.position.x = 300
		text.text = "Bee Swarm"


func _on_Quit_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Menu.tscn")


func _on_Techno_pressed():
	Global.charater = 1
	$Arrow.position.x = 0 
	text.text = "Wither"

func _on_Roboto_pressed():
	Global.charater = 0
	$Arrow.position.x = 611
	text.text = "Repair"

func _on_Bee_pressed():
	Global.charater = 2
	$Arrow.position.x = 300
	text.text = "Bee Swarm"
