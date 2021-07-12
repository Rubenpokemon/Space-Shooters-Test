extends PathFollow2D


var speed = Global.speed 
var starting_hp = Global.base_hp

var extra_hp

func _ready(): #Enemy Spawning
	if starting_hp >= 8 and starting_hp <= 16: 
		starting_hp = 17
	if starting_hp >= 18:
		speed += ((starting_hp - 17)* 10)
		print ("Extra speed: ", ((starting_hp - 17)* 20) )
		starting_hp = 17
	$Enemy_Body/Sprite.frame = starting_hp + 1
	$Enemy_Body.hp = starting_hp
	if Global.regen == "Yes":
		$Enemy_Body/Regen.start()

func _process(delta): #Moving
	if Global.moving == "Yes":
		offset += speed * delta
	if unit_offset == 1:
		Global.win = "No"
		Global.losing_wave = Global.wave
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://WinLose.tscn")

