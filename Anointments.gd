extends Node
class_name Anointments


var anointments = []


func _init(file_path : String):
	initialize(file_path)

func initialize(file_path : String):
	var file = File.new()
	file.open(file_path, File.READ)
	while not file.eof_reached():
		var csv_line = file.get_csv_line(";")
		if "#" in csv_line[0]:
			continue
		var anointment = Anointment.new(csv_line)
		anointments.append(anointment)

func get_for_item(poe_item ):
	for anointment in anointments:
		if poe_item.has_anointment(anointment):
			return anointment
