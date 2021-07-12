extends KinematicBody2D
var hp = 10
var speed = 300
var bullet = preload("res://Bullet.tscn")
var bullet2 = preload("res://Bullet.tscn")
var bullet3 = preload("res://Bullet.tscn")

var wither = preload("res://Techno_Q.tscn")
var bee = preload("res://Bee.tscn")
var bee_spawns = 0
var rng

func _ready(): #Spawning
	Global.hp = 10
	Global.mana = 30
	$Player.frame = Global.charater 
	if $Player.frame == 2:
		$Normal.disabled = true

func _process(delta): #PLayer Controls
	if Input.is_action_pressed("ui_left"):
# warning-ignore:return_value_discarded
		move_and_collide(Vector2(-speed * delta, 0))
	elif Input.is_action_pressed("ui_right"):
# warning-ignore:return_value_discarded
		move_and_collide(Vector2(speed * delta, 0))
	if Input.is_action_just_pressed("Boost"): #Start Boosting
		$Boost.start()
		if Global.mana >= 1:
			speed = 500
			Global.mana -= 1
	if Input.is_action_just_released("Boost"): #Stop Boosting
		speed = 300


	if Input.is_action_just_pressed("Fire"):
		var bulletspawn = bullet.instance()
		bulletspawn.position = Vector2(position.x, position.y )
		get_tree().get_root().add_child(bulletspawn)
		$Shooting.start()
		rng = randi()%100
		if rng <= Global.triple_chance:
			triple_shot()

#Special Ability
	if Input.is_action_just_pressed("Special") and Global.mana >= 15:
		Global.mana -= 15
		$Boost.start()
		if $Player.frame == 1:
			var witherspawn = wither.instance()
			get_tree().get_root().add_child(witherspawn)
		elif $Player.frame == 2:
			bee_spawns += 15
			$Bee2.start()
		else:
			if Global.hp <=8:
				Global.hp += 2
			else:
				Global.mana += 15

func hit(): #Getting Hit and losing
	Global.hp -= 1
	if Global.hp <= 0:
		Global.win = "No"
		Global.losing_wave = Global.wave
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://WinLose.tscn")

#Boosting and Mana Regen
func _on_Boost_timeout():
	if Input.is_action_pressed("Boost") and Global.mana >= 1:
		Global.mana -= 1
		$Boost.start()
		if Global.mana <= 0:
			speed = 300
	elif speed == 300 and Global.mana <= 29: #Mana Regen
		Global.mana += 0.25
		$Boost.start()


#Shooting
func _on_Shooting_timeout():
	if Input.is_action_pressed("Fire"):
		var bulletspawn = bullet.instance()
		bulletspawn.position = Vector2(position.x, position.y - 50)
		get_tree().get_root().add_child(bulletspawn)
		$Shooting.start()

		rng = randi()%100 #Triple shot chance
		print (Global.triple_chance)
		if rng <= Global.triple_chance:
			triple_shot()

#Spawns other 2 bullets for triple shot
func triple_shot():
	var bulletspawn2 = bullet2.instance()
	bulletspawn2.position = Vector2(position.x + 30, position.y - 45)
	get_tree().get_root().add_child(bulletspawn2)
	var bulletspawn3 = bullet3.instance()
	bulletspawn3.position = Vector2(position.x - 30, position.y - 40)
	get_tree().get_root().add_child(bulletspawn3)

#Bee ability
func _on_Bee2_timeout():
	if bee_spawns >= 1:
		bee_spawns -= 1
		var beespawn = bee.instance()
		get_tree().get_root().add_child(beespawn)
		$Bee2.start()
