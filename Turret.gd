extends AnimatedSprite

var bullet = preload("res://Bullet.tscn")
var type = "Poison"

func _ready():
	if type == "Poison":
		Global.poison_tick = 1.4
		frame = 1
		#$Shooting.start()

 


func _on_Shooting_timeout():
	var bulletspawn = bullet.instance()
	bulletspawn.position = Vector2(position.x, position.y - 50)
	bulletspawn.type = type 
	#get_tree().get_root().add_child(bulletspawn)
	
