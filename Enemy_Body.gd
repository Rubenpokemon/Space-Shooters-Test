extends KinematicBody2D

var hp = 0
var effect = "No"
var poisoned = "No"
var laser = preload("res://Laser.tscn")
var powerup = preload("res://Powerup.tscn")
var heal = preload("res://Heal.tscn")
var rng
func _ready():
	randomize()
	$Poison.wait_time = Global.poison_tick
# warning-ignore:unused_argument

func _process(delta):
	$Sprite.frame = hp - 1
	if hp <= 0:

		rng = randi()%30 #Healing
		if rng == 1  and Global.hp <= 9:
			var healInstance = heal.instance()
			healInstance.position = Vector2(global_position.x + 5, global_position.y + 20)
			get_tree().get_root().add_child(healInstance)

		rng = randi()%35 #Triple Shot Power Up
		if rng == 1:
			var powerInstance = powerup.instance()
			powerInstance.position = Vector2(global_position.x + 5, global_position.y + 20)
			get_tree().get_root().add_child(powerInstance)
		Global.kills += 1
		get_parent().queue_free()

func hit():
	hp -= 1


func Glue():
	if effect == "No":
		effect = "Yes"
		get_parent().speed -= 100
		$Effect.frame = 0
		$Effect.show()
		$Timer.wait_time = 10
		$Timer.start()

func Ice():
	if effect == "No":
		effect = "Yes"
		get_parent().speed = 0
		$Timer.wait_time = 2.5
		$Timer.start()
		$Effect.frame = 1
		$Effect.show()

func Confuse():
	if effect == "No":
		effect = "Yes"
		get_parent().speed = -get_parent().speed
		$Effect.frame = 2
		$Effect.show()
		$Timer.wait_time = 1
		$Timer.start()

func Poison():
	if effect == "No":
		effect = "Yes"
		poisoned = "Yes"
		$Effect.frame = 3
		$Effect.show()
		$Poison.start()
		$Timer.wait_time = 10.1
		$Timer.start()

func _on_Poison_timeout():
	if poisoned == "Yes":
		hp -= 1
		$Poison.start()

func _on_Timer_timeout():
	effect = "No"
	poisoned = "No"
	$Effect.hide()
	get_parent().speed = Global.speed




func _on_Regen_timeout():
	if hp < get_parent().starting_hp:
		hp += 1

var shooting_chance = 1
var shoot

func _on_Shooting_timeout():
	shoot = randi()%15
	if shoot <= shooting_chance:
		var laserInstance = laser.instance()
		laserInstance.position = Vector2(global_position.x + 5, global_position.y + 20)
		get_tree().get_root().add_child(laserInstance)
