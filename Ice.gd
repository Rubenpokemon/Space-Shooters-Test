extends Label


var price = Global.ice_chance + 1

func _ready():
	$Ice2.text = str(Global.ice_chance)
	if Global.spending >= price:
		$Plus.show()
	if Global.poison_chance >= 1:
		$Minus.show()


func _on_Plus_pressed():
	if Global.spending >= price and Global.total <= 99:
		Global.spending -= price
		Global.ice_chance += 1
		price += 1
		Global.total += 1
		$Ice2.text = str(Global.ice_chance)
		get_parent().reload()

func _on_Minus_pressed():
	if Global.ice_chance >= 1:
		Global.ice_chance -= 1
		price -= 1
		Global.total -= 1
		Global.spending += Global.ice_chance + 1
		$Ice2.text = str(Global.ice_chance)
		get_parent().reload()
		if Global.spending >= price:
			$Ice2.show()

func reload():
	if Global.spending >= price and Global.total <= 99:
		$Plus.show()
	else:
		$Plus.hide()

	if Global.ice_chance >= 1:
		$Minus.show()
	else:
		$Minus.hide()
