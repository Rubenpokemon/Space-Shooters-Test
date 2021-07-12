extends Control

func _on_Defend_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Game.tscn")




func _on_Quest_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Quest_Select.tscn")


func _on_Upgrades_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Upgrades.tscn")

var data = []

var save_path = SAVE_DIR + "save.dat"


const SAVE_DIR = "user://saves/"

func _on_Quit_pressed(): #Saving Data
#	var data = {
#		"Money": Global.spending,
#		"Triple%": Global.triple_chance,
#		"Poison%": Global.poison_chance,
#		"Glue%": Global.glue_chance,
#		"Confusion%": Global.confuse_chance,
#		"Ice%": Global.ice_chance,
#	}

	data = [
		Global.spending,
		Global.triple_chance,
		Global.poison_chance,
		Global.glue_chance,
		Global.confuse_chance,
		Global.ice_chance,
		Global.charater
	]

	var dir = Directory.new()
	if !dir.dir_exists(SAVE_DIR):
		dir.make_dir(SAVE_DIR)

	var file = File.new()
	var error = file.open(save_path, File.WRITE)
	if error == OK:
		file.store_var(data)
		file.close()
	print (data)
	get_tree().quit()


func _ready(): #Loading Data
	Global.in_game = "No"
	if Global.first_luanch == "Yes":
		Global.first_luanch = "No"
		var file = File.new()
		if file.file_exists(save_path):
			print ("Found file")
			var error = file.open(save_path, File.READ)
			if error == OK:
				var player_data = file.get_var()
				file.close()
				print (player_data)

				Global.spending = player_data[0]
				Global.triple_chance = player_data[1]
				Global.poison_chance = player_data[2]
				Global.glue_chance = player_data[3]
				Global.confuse_chance = player_data[4]
				Global.ice_chance = player_data[5]
				Global.charater = player_data[6]

func _on_Code_pressed(): #Codes
	if $Code_Text.text == "Code":
		Global.spending = 42069
	elif $Code_Text.text == "E":
		 Global.spending = 0
	if $Code_Text.is_visible_in_tree():
		$Code_Text.hide()
	else:
		$Code_Text.show()


func _on_Select_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Chrater_Select.tscn")
