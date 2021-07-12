extends KinematicBody2D


var speed = 250


func _ready():
	pass

func _process(delta):
	if (Input.is_action_pressed("ui_up")):
		move_and_collide(Vector2(0, -speed * delta))
	if (Input.is_action_pressed("ui_left")):
		move_and_collide(Vector2(-speed * delta, 0))
	if (Input.is_action_pressed("ui_down")):
		move_and_collide(Vector2(0, speed * delta))
	if (Input.is_action_pressed("ui_right")):
		move_and_collide(Vector2(speed * delta, 0))
