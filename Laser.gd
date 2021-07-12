extends KinematicBody2D


var speed = 450


func _process(delta):
	var collidedObject = move_and_collide(Vector2( 0, speed * delta))
	if (collidedObject):
		collidedObject.get_collider().hit()
		queue_free()
	if global_position.y >= 750:
		queue_free()

func hit():
	queue_free()
