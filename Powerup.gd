extends KinematicBody2D


var speed = 200
var normal 
var moving = "Yes"

func _ready():
	if Global.triple_chance == 100:
		queue_free()

func _process(delta):
	if moving == "Yes":
		var collidedObject = move_and_collide(Vector2( 0, speed * delta))
		if (collidedObject):
			moving = "No"
			normal = Global.triple_chance
			Global.triple_chance = 100
			hide()
			$CollisionShape2D.disabled = true
			$Timer.start()
		if global_position.y >= 750:
			queue_free()
			pass
func hit():
	pass


func _on_Timer_timeout():
	Global.triple_chance = normal
