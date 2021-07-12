extends Label


var names = ["Ruben", "Jones", "Mateja", "Tasman", "Ryan", "Hamish", "Owen"]
var name_addons = ["The allmighty" , "The destoryer of worlds", "The bastard", "The destoryer", "The conquering", "The Sicc Lad"
, "The gamer", "The Gang Leader", "The evil person", "The legend"]

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	var chosen_name = names[randi()%7]
	var chosen_name2 = names[randi()%7]
	var name_addon = name_addons[randi()%10]
	if chosen_name2 == chosen_name:
		chosen_name2 = "Aby"

	text = ("Save " + str(chosen_name) + " from " + str(chosen_name2 ) +" "+ str(name_addon)+ "!")
