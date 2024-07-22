extends RefCounted
class_name Skill_Node

var skill : String
var skill_name : String
var recipe_oils = []
var stats : Array[String]


func set_skill(line):
	var parts = line.split("=")
	skill = trim_line(parts[1])
	
func set_skill_name(line):
	var parts = line.split("=")
	skill_name = trim_line(parts[1])

func add_oil(line):
	recipe_oils.append(trim_line(line))

func add_stats_entry(line):
	stats.append(trim_line(line))

func trim_line(line):
	return line.replacen("\"", "").replacen(",", "")

func as_csv_line_array():
	var array = []
	array.append(skill_name)
	for recipe_oil in recipe_oils:
		array.append(recipe_oil)
		
	return array
	
