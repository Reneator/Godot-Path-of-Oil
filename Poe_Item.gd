extends RefCounted
class_name Poe_Item

var clip_board_data

var item_class #Amulets or Rings
var enchants = []

func initialize(data ):
	clip_board_data = data

	var lines = clip_board_data.split("\n")
	for line in lines:
		if "Item Class:" in line:
			item_class = line.replace("Item Class:","").strip_edges()
		if not "(enchant)" in line:
			continue
		enchants.append(line.to_lower())

func has_anointment(anointment):
	for enchant in enchants:
		if anointment.enchant_text in enchant:
			return true
