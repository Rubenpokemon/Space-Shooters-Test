extends KinematicBody2D



var hp = 0
var effect = "No"


# warning-ignore:unused_argument
func _process(delta):
	$Sprite.frame = hp - 1
	if hp <= 0:
		get_parent().queue_free()

func hit():
	hp -= 1



func Glue():
	if effect == "No":
		effect = "Yes"
		get_parent().speed -=40
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
		get_parent().speed = -80
		$Effect.frame = 2
		$Effect.show()
		$Timer.wait_time = 1
		$Timer.start()




func _on_Timer_timeout():
	effect = "No"
	$Effect.hide()
	get_parent().speed = 100
