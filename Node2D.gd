extends Node2D



# warning-ignore:unused_argument
func _process(delta):
	$HP.value = Global.hp
	$Mana.value = Global.mana


func _ready():
	$Char.frame = Global.charater
