extends Node
class_name Anointments

var anoint_file_system_name = "Anoints.csv"

var anointments = []


func _init(file_path : String):
	initialize(file_path)

func initialize(file_path : String):
	#load_legacy_amulet_anointments()
	load_ring_anointments()
	load_amulet_anointments()
	load_manual_anointments()

#func load_legacy_amulet_anointments():
	#var file_path = "res://Assets/Pre3.25Amulet_Anoints.txt"
	#load_anointments(file_path, "Amulets")

func load_manual_anointments():
	var dir = OS.get_executable_path().get_base_dir()
	var file_path = dir + "/" + anoint_file_system_name
	load_anointments(file_path, "Amulets")

func load_ring_anointments():
	var file_path = "res://Assets/Ring_Anointments_csv.txt"
	load_anointments(file_path, "Rings")

func load_amulet_anointments():
	var file_path = "res://Assets/Amulet_Anointments_csv.txt"
	load_anointments(file_path, "Amulets")

func load_anointments(file_path : String, item_class):
	var file = FileAccess.open(file_path, FileAccess.READ)
	print("Loading File %s" % file_path)
	var error = FileAccess.get_open_error()
	if error != 0:
		print("Error loading file: %s" % error)
		return
	while not file.eof_reached():
		var csv_line = file.get_csv_line(";")
		var anointment = Anointment.new(csv_line)
		anointment.item_class = item_class
		var existing_anoint : Anointment = get_existing_anointment(anointment)
		if existing_anoint != null and not existing_anoint.oils_equal(anointment):
			print("Replacing %s Anoint Oils: %s -> %s" % [existing_anoint.enchant_text, existing_anoint.oils, anointment.oils])
			anointments.erase(existing_anoint)
		anointments.append(anointment)

func get_existing_anointment(_anointment: Anointment):
	for anointment : Anointment in anointments:
		if anointment.equals(_anointment):
			return anointment

func get_for_item(poe_item ):
	for anointment in anointments:
		if not anointment.item_class == poe_item.item_class:
			continue
		if poe_item.has_anointment(anointment):
			return anointment
