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
	# black - normal land
	if (pixel[0] == 0 && pixel[1] == 0 && pixel[2] == 0):
		grass.set_cellv(Vector2(x, y), 0)

	# red - set spawners
	elif (pixel[0] == 1 && pixel[1] == 0 && pixel[2] == 0):
		grass.set_cellv(Vector2(x, y), 0)
		
		var spawner = load("res://EnemySpawner.tscn").instance();
		spawner.init(grass.map_to_world(Vector2(x, y)));
		get_parent().get_node("Entity_Order").call_deferred("add_child", spawner)
		
	# green - set player pos
	elif (pixel[0] == 0 && pixel[1] == 1 && pixel[2] == 0):
		grass.set_cellv(Vector2(x, y), 0)
		
		get_parent().get_node("Entity_Order/Player").global_position = grass.map_to_world(Vector2(x, y));
