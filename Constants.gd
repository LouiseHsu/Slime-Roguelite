extends Node
# VALUE
var VIEWPORT_WIDTH = ProjectSettings.get_setting("display/window/size/width");
var VIEWPORT_HEIGHT = ProjectSettings.get_setting("display/window/size/height")	

# ENEMY
var BLUE_SLIME = "res://Enemies/BlueSlime.tscn"
var GREEN_SLIME = "res://Enemies/GreenSlime.tscn"

# WEAPON
const WEAPON_1_NAME = "side_weapon";
const WEAPON_2_NAME = "circle_weapon";
const WEAPON_3_NAME = "front_weapon";

const WEAPONS_LIST = [WEAPON_1_NAME, WEAPON_2_NAME, WEAPON_3_NAME]
