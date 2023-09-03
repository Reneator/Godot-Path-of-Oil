extends Node
class_name Oil

@export var icon : Texture2D


func equals(oil: String):
	return name in oil
