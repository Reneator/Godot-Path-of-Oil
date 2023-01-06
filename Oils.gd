extends Reference
class_name Oils

var oils = []

func _init(dir_path: String):
	initialize(dir_path)

func initialize(dir_path):
	var dir = Directory.new()
	if dir.open(dir_path) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if not dir.current_is_dir():
				load_oil(file_name)
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")


func load_oil(file_name : String):
	var oil = Oil.new()
	oil.name = file_name.get_file().replace(".png","")
	oil.icon = load(file_name)


func get_for_anointment(anointment):
	var _oils = []
	for oil in oils:
		if anointment.has_oil(oil):
			_oils.append(oil)
	return _oils
