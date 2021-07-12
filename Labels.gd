extends Control


func _ready():
	Global.total = Global.poison_chance + Global.confuse_chance + Global.glue_chance + Global.ice_chance
	reload()



func reload(): #Reloads all the buttons
	$Triple.reload()
	$Poison.reload()
	$Glue.reload()
	$Confuse.reload()
	$Ice.reload()
	$Upgrade_Points/Label.text = str(Global.spending)


func _on_Plus_pressed():
	print ("Click")
