extends PathFollow2D


var speed = 100 
var starting_hp = 100

func _ready():
	$Devil_Body.hp = starting_hp


func _process(delta):
	offset += speed * delta
