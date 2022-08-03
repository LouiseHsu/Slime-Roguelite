extends Node
# VALUE
var VIEWPORT_WIDTH = ProjectSettings.get_setting("display/window/size/width");
var VIEWPORT_HEIGHT = ProjectSettings.get_setting("display/window/size/height")	

# ENEMY
const BLUE_SLIME = "blueslime"
const GREEN_SLIME = "greenslime"
const PINK_SLIME = "pinkslime"

const ENEMYS_LIST = [BLUE_SLIME, GREEN_SLIME, PINK_SLIME];

# WEAPON
const WEAPON_1_NAME = "side_weapon";
const WEAPON_2_NAME = "circle_weapon";
const WEAPON_3_NAME = "front_weapon";

const WEAPONS_LIST = [WEAPON_1_NAME, WEAPON_2_NAME, WEAPON_3_NAME]

func delete_children(node):
	for n in node.get_children():
		n.queue_free()
