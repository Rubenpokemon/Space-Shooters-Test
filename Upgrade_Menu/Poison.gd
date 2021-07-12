extends Label
var price = Global.poison_chance + 1

func _ready():
	$Poison2.text = str(Global.poison_chance)
	if Global.spending >= price:
		$Plus.show()
	if Global.poison_chance >= 1:
		$Minus.show()


func _on_Plus_pressed():
	if Global.spending >= price and Global.total <= 99:
		Global.spending -= price
		Global.poison_chance += 1
		price += 1
		Global.total += 1
		$Poison2.text = str(Global.poison_chance)
		get_parent().reload()

func _on_Minus_pressed():
	if Global.poison_chance >= 1:
		Global.poison_chance -= 1
		price -= 1
		Global.total -= 1
		Global.spending += Global.poison_chance + 1
		$Poison2.text = str(Global.poison_chance)
		get_parent().reload()
		if Global.spending >= price:
			$Plus.show()

func reload():
	price = Global.poison_chance + 1
	if Global.spending >= price and Global.total <= 99:
		$Plus.show()
	else:
		$Plus.hide()

	if Global.poison_chance >= 1:
		$Minus.show()
	else:
		$Minus.hide()
