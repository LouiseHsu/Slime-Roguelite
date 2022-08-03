extends Node

onready var grass = $Grass
var _tileset

func _ready():
	_tileset = grass.get_tileset()
	set_process_input(true)
	
	var map = load("res://Maps/map.png")
	var data = map.get_data()
	data.lock()
	
	for x in range(data.get_width()):
		for y in range(data.get_height()):
			var pixel = data.get_pixel(x ,y)

			set_pixel_type(pixel, x, y)
		
	grass.update_bitmask_region()
	
func set_pixel_type(pixel, x, y):
	# black
	if (pixel[0] == 0 && pixel[1] == 0 && pixel[2] == 0):
		grass.set_cellv(Vector2(x, y), 0)
		pass;
	# red
	elif (pixel[0] == 1 && pixel[1] == 0 && pixel[2] == 0):
		print(pixel)
		
		grass.set_cellv(Vector2(x, y), 0)
		var spawner = load("res://EnemySpawner.tscn").instance();
		print(Vector2(x, y));
		spawner.init(grass.map_to_world(Vector2(x, y)));
		
		get_parent().call_deferred("add_child", spawner)
		print("hi")
		print(get_parent().get_children())
		pass;
	# green
	elif (pixel[0] == 0 && pixel[1] == 1 && pixel[2] == 0):
		grass.set_cellv(Vector2(x, y), 0)
		
		get_parent().get_node("Player").global_position = grass.map_to_world(Vector2(x, y));

		pass;
