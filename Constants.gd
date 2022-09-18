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

func deep_clone(source :Object) :
	var clone = source.duplicate()
	# copy all property values
	for property in source.get_property_list():
		var property_name = property["name"]
		clone.set(property_name, source.get(property_name))
	
	if source is Node:
		# remove incomplete duplicated childs
		for child in clone.get_children():
			clone.remove_child(child)
			child.free()
		assert(clone.get_child_count() == 0)
		# clone childs
		for child in source.get_children():
			clone.add_child(deep_clone(child))

# orb types
const PINK_ORB = "pink_orb"
const BLUE_ORB = "blue_orb"
const PURPLE_ORB = "purple_orb"
const YELLOW_ORB = "yellow_orb"

# orb names
const UP_ORB = "UpOrb"
const DOWN_ORB = "DownOrb"
const LEFT_ORB = "LeftOrb"
const RIGHT_ORB = "RightOrb"
