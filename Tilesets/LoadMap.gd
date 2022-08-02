extends TileMap


var _tileset

func _ready():
	_tileset = get_tileset()
	set_process_input(true)

	for x in range(32):
		for y in range(32):
			set_cellv(Vector2(x, y), 0)
			
	update_bitmask_region()
