extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	InstanciateTilemap();


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func InstanciateTilemap():
	var set = load("res://Tilesets/Grass.tscn::1");

	var map = TileMap.new();
	map.tile_set = set;
	map.cell_size = Vector2(16, 16);

	
	var size = OS.window_size;
#
#		for(var horizontalIndex = 0; horizontalIndex < 16; horizontalIndex++)
#		 for(var verticalIndex = 0; verticalIndex < 16; verticalIndex++)
#			map.SetCell(
#				horizontalIndex,
#				verticalIndex,
#				1
#			);
	for x in range(32):
		for y in range(32):
			map.set_cell(map.map_to_world(Vector2(x, y)).x,map.map_to_world(Vector2(x, y)).y, 1)

	map.update_bitmask_region();
	
	get_tree().get_root().get_node("World").add_child(map);

