extends RefCounted
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

func has_oil(_oil : Oil):
	for oil in oils:
		if _oil.equals(oil):
			return true

func equals(_anointment : Anointment):
	return _anointment.enchant_text == enchant_text

func oils_equal(_anointment : Anointment):
	if oils.size() != _anointment.oils.size():
		return false
	for i in range(oils.size()):
		var oil = oils[i]
		var _oil = _anointment.oils[i]
		if oil != _oil:
			return false
	return true
