extends KinematicBody2D

var speed = 1500
var type = "Normal"
var rng
func _ready():
	if Global.moving == "No":
		queue_free()
	randomize()
	rng = randi()%100
 # Start Picking Bullet Type
	rng = randi()%100
	if rng <= Global.poison_chance - 1 and type == "Normal":
		type = "Poison"

	rng = randi()%100
	if rng <= Global.confuse_chance - 1 and type == "Normal":
		type = "Confuse"

	rng = randi()%100
	if rng <= Global.glue_chance - 1 and type == "Normal":
		type = "Glue"

	rng = randi()%100
	if rng <= Global.ice_chance - 1 and type == "Normal":
		type = "Ice"

	if type == "Glue":
		$Sprite.frame = 1
	if type == "Poison":
		$Sprite.frame = 2
	if type == "Confuse":
		$Sprite.frame = 3
# Stop Picking Bullet Type

func _process(delta): #Moving
	var collidedobject = move_and_collide(Vector2(0, -speed * delta))
	if collidedobject:
		collidedobject.get_collider().hit() #Choosing attack
		if type == "Glue":
			collidedobject.get_collider().Glue()
		if type == "Ice":
			collidedobject.get_collider().Ice()
		if type == "Confuse":
			collidedobject.get_collider().Confuse()
		if type == "Poison":
			collidedobject.get_collider().Poison()
		queue_free()
	if global_position.y <= -100:
		queue_free()


#Getting Hit by other bulllets
func hit():
	queue_free()
func Glue():
	queue_free()
func Ice():
	queue_free()
func Confuse():
	queue_free()
func Poison():
	queue_free()


