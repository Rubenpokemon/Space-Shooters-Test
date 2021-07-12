extends KinematicBody2D
var rng
var bullet = preload("res://Friendly_Bullet.tscn")
var bullet2 = preload("res://Friendly_Bullet.tscn")
var bullet3 = preload("res://Friendly_Bullet.tscn")
var speed = rand_range(100,200)
var hp = 10

func _ready():
	global_position.x = 50
	global_position.y = 550

func _process(delta):
	move_local_x(speed * delta)
	if global_position.x >= 1250:
		speed *= -1
	if global_position.x <= 40:
		speed *= -1
	if Global.in_game != "Yes":
		queue_free()

func hit():
	hp -= 1
	if hp <= 0:
		queue_free()


func _on_Timer_timeout():
	#$Timer.wait_time = rand_range(1,2)
	var bulletspawn = bullet.instance()
	bulletspawn.position = Vector2(position.x, position.y - 50)
	get_tree().get_root().add_child(bulletspawn)
	rng = randi()%100
	if rng <= Global.triple_chance:
		triple_shot()

func _on_Death_timeout():
	queue_free()

func triple_shot():
	var bulletspawn2 = bullet2.instance()
	bulletspawn2.position = Vector2(position.x + 30, position.y - 45)
	get_tree().get_root().add_child(bulletspawn2)
	var bulletspawn3 = bullet3.instance()
	bulletspawn3.position = Vector2(position.x - 30, position.y - 40)
	get_tree().get_root().add_child(bulletspawn3)
