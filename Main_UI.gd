extends Control



var anointments
var oils

var current_data

# Called when the node enters the scene tree for the first time.
func _ready():
	initialize()

func initialize():
	oils = Oils.new("res://data/imgs")
	anointments = Anointments.new("res://data/Anointments.csv")
	
func _process(delta):
	var string : String = OS.clipboard
	if current_data == string:
		return
	if not string.begins_with("Item Class:") and not string.length() > 50:
		return
	current_data = string
	var item = Poe_Item.new()
	item.initialize(string)
	
	display_oils(item)

func display_oils(poe_item):
	clear()
	var anointment = anointments.get_for_item(poe_item)
	if not anointment:
		return
		
	var _oils = oils.get_for_anointment(anointment)
	
	for oil in _oils:
		add_element(oil)

func add_element(oil):
	pass

func clear():
	for child in $OilList.get_children():
		child.queue_free()
