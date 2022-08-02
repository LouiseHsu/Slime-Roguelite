extends TileMap


var _tileset

func _ready():
	_tileset = get_tileset()
	set_process_input(true)
	
	var map = load("res://Maps/map.png")
	var data = map.get_data()
	data.lock()
	
	

	for x in range(data.get_width()):
		for y in range(data.get_height()):
			var pixel = data.get_pixel(x ,y)
			if (pixel[0] == 0) :
				set_cellv(Vector2(x, y), 0)

			
	update_bitmask_region()
	
	
