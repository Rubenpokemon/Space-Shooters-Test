extends KinematicBody2D


var speed = 200


func _process(delta):
	var _collidedObject = move_and_collide(Vector2( 0, speed * delta))
	if global_position.y >= 750:
		queue_free()

func hit():
	pass


func _on_Area2D_body_entered(_body):
	Global.hp += 1
	print ("Heal")
	queue_free()
