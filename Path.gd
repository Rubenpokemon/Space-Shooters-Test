extends Path2D

var enemy = preload("res://Enemy.tscn")
var devil = preload("res://Devil.tscn")
var offset = 50
var spawns = 72 #72
var wave = 1

# warning-ignore:unused_argument
func _process(delta):
	if Global.kills == 73:
		Global.wave += 1
		get_parent().update_wave()
		print ("Wave: ", Global.wave)
		if Global.wave == 2:
			Global.base_hp += 2
		if Global.wave == 3:
			Global.base_hp += 2
			Global.speed += 50
		if Global.wave == 4:
			Global.regen = "Yes"
		$Enemy_Spawn.start()
		Global.kills = 0
		spawns = 72
		Global.moving = "No"
		if Global.wave == 5:
			Global.win = "Yes"
# warning-ignore:return_value_discarded
			get_tree().change_scene("res://WinLose.tscn")

func _on_Enemy_Spawn_timeout():
	var enemyspawn = enemy.instance()
	enemyspawn.offset = offset
	add_child(enemyspawn)
	if spawns >= 1:
		offset += 70
		spawns -= 1
		$Enemy_Spawn.start()
	elif spawns == 0:
		offset = 50
		Global.moving = "Yes"

func _ready():
	Global.moving = "No"
	Global.wave = 1


	if Global.stars == 1:
		Global.base_hp = round(rand_range(1,2))

	if Global.stars == 2:
		Global.base_hp = 3

	if Global.stars == 3:
		Global.base_hp = 4

	if Global.stars == 4:
		Global.base_hp = round(rand_range(17,18))

	if Global.stars == 5:
		Global.base_hp = round(rand_range(23,25))
	$Enemy_Spawn.start()
	print ("Starting Hp: ", Global.base_hp)
