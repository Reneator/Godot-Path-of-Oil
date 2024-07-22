extends Node

var oils = []

func _ready():
	oils = get_children()

func get_oil(oil_name):
	for oil : Oil in oils:
		if oil.equals(oil_name):
			return oil

func get_for_anointment(anointment):
	var _oils = []
	for oil_name in anointment.oils:
		var oil = get_oil(oil_name)
		if oil:
			_oils.append(oil)
	return _oils
