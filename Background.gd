extends ParallaxBackground


var speed = 100


func _ready():
	pass # Replace with function body.


func _process(delta):
	$ParallaxLayer.scroll_offset += speed * delta
