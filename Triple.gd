extends Label


var price = Global.triple_chance + 2

func _ready():
	$Triple2.text = str(Global.triple_chance)
	if Global.spending >= price:
		$Plus.show()
	if Global.triple_chance >= 1:
		$Minus.show()


func _on_Plus_pressed():
	if Global.spending >= price:
		Global.spending -= price
		Global.triple_chance += 1
		price += 2
		$Triple2.text = str(Global.triple_chance)
		get_parent().reload()

func _on_Minus_pressed():
	if Global.triple_chance >= 1:
		Global.triple_chance -= 1
		price -= 2
		Global.spending += Global.triple_chance + 1
		$Triple2.text = str(Global.triple_chance)
		get_parent().reload()
		if Global.spending >= price:
			$Plus.show()

func reload():
	if Global.spending >= price:
		$Plus.show()
	else:
		$Plus.hide()

	if Global.triple_chance >= 1:
		$Minus.show()
	else:
		$Minus.hide()
