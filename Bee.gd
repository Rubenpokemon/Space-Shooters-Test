extends KinematicBody2D

var speed = 800

func _ready():
	global_position.x = rand_range(20 , 1255)

func _process(delta):
	var collidedobject = move_and_collide(Vector2(0, -speed * delta))
	if collidedobject:
		for x in 5:
			collidedobject.get_collider().hit()
		collidedobject.get_collider().Glue()
		queue_free()

func hit():
	pass
func Glue():
	pass
