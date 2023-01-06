extends Node
class_name Anointments


var anointments = []


func _init(file_path : String):
	initialize(file_path)

func initialize(file_path : String):
	var file = File.new()
	file.open(file_path, File.READ)
	var item_class
	while not file.eof_reached():
		var csv_line = file.get_csv_line(";")
		if "#" in csv_line[0]:
			item_class = csv_line[0].replace("#","")
			continue
		var anointment = Anointment.new(csv_line)
		anointment.item_class = item_class
		anointments.append(anointment)

func get_for_item(poe_item ):
	for anointment in anointments:
		if not anointment.item_class == poe_item.item_class:
			continue
		if poe_item.has_anointment(anointment):
			return anointment
