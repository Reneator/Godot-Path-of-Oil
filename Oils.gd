extends Node

var oils = []

func _ready():
	oils = get_children()
#
#func _init(dir_path: String):
#	initialize(dir_path)
#
#func initialize(dir_path):
#	var dir = Directory.new()
#	if dir.open(dir_path) == OK:
#		dir.list_dir_begin()
#		var file_name = dir.get_next()
#
#		while file_name != "":
#			if ".import" in file_name or ".ico" in file_name:
#				file_name = dir.get_next()
#				continue
#			if not dir.current_is_dir():
#				load_oil(dir_path + "/" + file_name)
#			file_name = dir.get_next()
#	else:
#		print("An error occurred when trying to access the path.")
#
#	print("Oils loaded: %s" % [oils])

#
#func load_oil(file_name : String):
#	var oil = Oil.new()
#	oil.name = file_name.get_file().replace(".png","")
#	print("Oil %s loaded for file_name %s" % [oil.name, file_name] )
#	oil.icon = load(file_name)
#	oils.append(oil)

func get_oil(oil_name):
	for oil in oils:
		if oil.name == oil_name:
			return oil


func get_for_anointment(anointment):
	var _oils = []
	for oil_name in anointment.oils:
		var oil = get_oil(oil_name)
		if oil:
			_oils.append(oil)
	return _oils
