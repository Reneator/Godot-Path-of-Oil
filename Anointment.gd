extends Reference
class_name Anointment

var enchant_text
var item_class
var oils = []

func _init(csv_line):
	var index = -1
	for string in csv_line:
		index += 1
		if index == 0:
			enchant_text = string.to_lower()
			continue
		
		oils.append(string)

func has_oil(_oil):
	for oil in oils:
		if oil == _oil.name:
			return true
