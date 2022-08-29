extends Node2D

onready var map_generator = $MapGenerator;
onready var entity_order = $Entity_Order;
onready var player = $Entity_Order/Player;

func ready():
	map_generator.connect("next_level", self, "load_next_level")
	
func _process(delta):
	handle_input();

func load_next_level():
	print("hewwodasdasdasd")
	map_generator.load_next_map();
	entity_order.clear_all();

func _on_MapGenerator_next_level():
	load_next_level();
	pass # Replace with function body.

func handle_input():
	if Input.is_action_just_released("Restart") :
		map_generator.reload_map();
		entity_order.clear_all();
		
		
