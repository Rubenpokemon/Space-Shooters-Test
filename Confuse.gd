extends Label


var price = Global.confuse_chance + 1

func _ready():
	$Confuse2.text = str(Global.confuse_chance)
	if Global.spending >= price:
		$Plus.show()
	if Global.poison_chance >= 1:
		$Minus.show()


func _on_Plus_pressed():
	if Global.spending >= price and Global.total <= 99:
		Global.spending -= price
		Global.confuse_chance += 1
		price += 1
		Global.total += 1
		$Confuse2.text = str(Global.confuse_chance)
		get_parent().reload()

func _on_Minus_pressed():
	if Global.confuse_chance >= 1:
		Global.confuse_chance -= 1
		price -= 1
		Global.total -= 1
		Global.spending += Global.confuse_chance + 1
		$Confuse2.text = str(Global.confuse_chance)
		get_parent().reload()
		if Global.spending >= price:
			$Plus.show()

func reload():
	if Global.spending >= price and Global.total <= 99:
		$Plus.show()
	else:
		$Plus.hide()

	if Global.confuse_chance >= 1:
		$Minus.show()
	else:
		$Minus.hide()
