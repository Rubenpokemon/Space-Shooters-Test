extends TextureButton


var reward
var stars = 2
func _ready():
	print (stars)
	randomize()
	refresh()

func refresh():
	$Stars.value = stars
	reward = round(rand_range(80,120) * stars)
	$Reward.text = "$" + str(reward)
