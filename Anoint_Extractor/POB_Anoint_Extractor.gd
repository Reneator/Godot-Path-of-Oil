extends Node

@export_file var file_path

func _ready():
	load_anoints()

func load_anoints():
	var file = FileAccess.open(file_path, FileAccess.READ)
	
	var skill_nodes : Array[Skill_Node]= []
	
	var skill_node : Skill_Node
	var is_stats = false
	var is_recipe = false
	
	while(!file.eof_reached()):
		var line = file.get_line()
		print(line)
		if "\"skill\"" in line:
			skill_node = Skill_Node.new()
			skill_node.set_skill(line)
		if not skill_node:
			continue
		if "\"name\"" in line:
			skill_node.set_skill_name(line)
		
		if "\"recipe\"" in line:
			is_recipe = true
			skill_nodes.append(skill_node)
		if is_recipe and "}" in line:
			is_recipe = false
		if is_recipe and not "recipe" in line:
			skill_node.add_oil(line)

			
		if "\"stats\"" in line:
			is_stats = true
		if is_stats and "}" in line:
			is_stats = false
		if is_stats and not "\"stats\"" in line:
			skill_node.add_stats_entry(line)
	file.close()
	export_amulet_skill_nodes(skill_nodes)

func export_amulet_skill_nodes(skill_nodes : Array[Skill_Node]):
	var file = FileAccess.open("res://Anoint_Extractor/exported_csv.txt", FileAccess.WRITE)
	var error = FileAccess.get_open_error()
	skill_nodes.sort_custom(sort_skill_nodes_array)
	for skill_node : Skill_Node in skill_nodes:
		file.store_csv_line(skill_node.as_csv_line_array(), ";")
	file.close()

func sort_skill_nodes_array(a: Skill_Node, b: Skill_Node):
	return a.skill_name < b.skill_name
		
	
