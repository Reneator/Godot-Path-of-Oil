extends Control


export (PackedScene) var oil_element_scene

var anointments

var current_data

onready var oil_list = $Oil_List

var delay = 0.2 #1 second delay
var current_delay = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	initialize()

func initialize():
	anointments = Anointments.new("res://Assets/Anointments_csv.txt")
	
func _process(delta):
	current_delay += delta
	if current_delay < delay:
		return
	current_delay = 0
	var string : String = OS.clipboard
	if current_data == string:
		return
	if not string.begins_with("Item Class:") and not string.length() > 50:
		return
	current_data = string
	var item = Poe_Item.new()
	item.initialize(string)
	
	display_oils(item)
	print("oils are being displayed now")

func display_oils(poe_item):
	clear()
	var anointment = anointments.get_for_item(poe_item)
	if not anointment:
		return
		
	var _oils = Oils.get_for_anointment(anointment)
	
	print("iterating over oils: %s" % [_oils])
	for oil in _oils:
		print("before add element for oil: %s" % [oil.name])
		add_element(oil)

func add_element(oil):
	var oil_element = oil_element_scene.instance()
	oil_element.texture = oil.icon
	oil_list.add_child(oil_element)

func clear():
	for child in oil_list.get_children():
		child.queue_free()
