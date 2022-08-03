extends TileMap


var _tileset
onready var grass = $Grass;

func _ready():
	_tileset = get_tileset()
	set_process_input(true)
	
	var map = load("res://Maps/map.png")
	var data = map.get_data()
	data.lock()
	
	for x in range(data.get_width()):
		for y in range(data.get_height()):
			var pixel = data.get_pixel(x ,y)

			set_pixel_type(pixel, x, y)
		
	update_bitmask_region()
	
func set_pixel_type(pixel, x, y):
	# black
	if (pixel[0] == 0 && pixel[1] == 0 && pixel[2] == 0):
		set_cellv(Vector2(x, y), 0)
		pass;
	# red
	elif (pixel[0] == 1 && pixel[1] == 0 && pixel[2] == 0):
		print(pixel)
		
		set_cellv(Vector2(x, y), 0)
		var spawner = load("res://EnemySpawner.tscn").instance();
		spawner.init(map_to_world(Vector2(x, y)));
		
		get_tree().get_root().get_node("World").add_child(spawner);
		print("hi")
		pass;
	# green
	elif (pixel[0] == 0 && pixel[1] == 1 && pixel[2] == 0):
		set_cellv(Vector2(x, y), 0)
		print(Vector2(x, y));
		get_parent().get_node("Player").global_position = grass.map_to_world(Vector2(x, y));

		pass;
