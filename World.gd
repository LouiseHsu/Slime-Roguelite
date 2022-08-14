extends Node2D

onready var map_generator = $MapGenerator;

func ready():
	map_generator.connect("next_level", self, "load_next_level")

func load_next_level():
	print("hewwodasdasdasd")
	map_generator.load_next_map();


func _on_MapGenerator_next_level():
	load_next_level();
	pass # Replace with function body.
