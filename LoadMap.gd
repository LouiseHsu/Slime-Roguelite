extends Node

onready var grass = $Grass
onready var sky = $Sky

var curr_map_num = -1;
var num_spawner = 0;

signal next_level;

func _ready():
	set_process_input(true)
	self.connect('next_level', get_tree().get_root().get_node("World"), "load_next_level");
	
	load_next_map();
	
func set_pixel_type(pixel, x, y):
	# black - normal land
	if (pixel[0] == 0 && pixel[1] == 0 && pixel[2] == 0):
		grass.set_cellv(Vector2(x, y), 0)

	# red - set spawners
	elif (pixel[0] == 1 && pixel[1] == 0 && pixel[2] == 0):
		grass.set_cellv(Vector2(x, y), 0)
		
		var spawner = load("res://EnemySpawner.tscn").instance();
		
		spawner.init(grass.map_to_world(Vector2(x, y)));
		spawner.connect("spawner_destroyed", self, "decrease_spawner_count")
		increase_spawner_count()
		
		get_parent().get_node("Entity_Order").call_deferred("add_child", spawner)
		
	# green - set player pos
	elif (pixel[0] == 0 && pixel[1] == 1 && pixel[2] == 0):
		grass.set_cellv(Vector2(x, y), 0)
#
#	elif (pixel[0] ==1 && pixel[1] == 1 && pixel[2] == 1):
#		sky.set_cellv(Vector2(x, y), 0)	
		get_parent().get_node("Entity_Order/Player").init_at(grass.map_to_world(Vector2(x, y)));


func reload_map():
	var map = load("res://Maps/map" + str(curr_map_num) + ".png")
	var data = map.get_data()
	data.lock()
	num_spawner = 0;
	
	for x in range(data.get_width()):
		for y in range(data.get_height()):
			var pixel = data.get_pixel(x ,y)
			sky.set_cellv(Vector2(x, y), 0)
			set_pixel_type(pixel, x, y)
		
	grass.update_bitmask_region()
		
func load_next_map():
	set_process_input(true)
	curr_map_num = curr_map_num + 1;

	var fileChecker = File.new()
	var doFileExists = fileChecker.file_exists("res://Maps/map" + str(curr_map_num) + ".png");
	
	if (!doFileExists):
		print("file doesnt exist")
		get_tree().change_scene("res://EndScreen.tscn")
		return;
		
	var map = load("res://Maps/map" + str(curr_map_num) + ".png")
	var data = map.get_data()
	data.lock()
	
	for x in range(data.get_width()):
		for y in range(data.get_height()):
			var pixel = data.get_pixel(x ,y)
			sky.set_cellv(Vector2(x, y), 0)
			set_pixel_type(pixel, x, y)
		
	grass.update_bitmask_region()
	
func decrease_spawner_count():
	num_spawner-= 1;
	print("hewwo")
	if (num_spawner == 0):
		emit_signal("next_level")
		print("next")
		print(num_spawner)
		
	
func increase_spawner_count():
	num_spawner+= 1;
	
func save():
	var save_dict = {
		"curr_map" : curr_map_num
	}
	
	return save_dict;
