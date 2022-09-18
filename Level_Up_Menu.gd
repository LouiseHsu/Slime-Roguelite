extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# dict of 4 items - north east south west orbs
# for each orb, we need to know it's type and level, and if its unlocked

onready var buttonGridContainer = $MarginContainer/TextureRect/ButtonGridContainer
onready var displayGridContainer = $MarginContainer/TextureRect/DisplayGridContainer

var orbs_info = {
	"Up" : {
		"type" : Constants.PINK_ORB,
		"level" : 1,
	},
	"Right" : {
		"type" : Constants.BLUE_ORB,
		"level" : 1,
	},
	"Down" : {
		"type" : null,
		"level" : 0,
	},
	"Left" : {
		"type" : null,
		"level" : 0,
	}
}
# Called when the node enters the scene tree for the first time.
func _ready():
	update_display()
	pass # Replace with function body.
	
func update_display():
	for orb in orbs_info.keys():
		var button = buttonGridContainer.get_node(orb + "OrbButton")
		var display = displayGridContainer.get_node(orb + "OrbDisplay")
		
		var orb_info = orbs_info[orb];
		
		if (orb_info["level"] == 0):
			display.texture = load("res://UI/" + "lock" + ".png")
		else:
			display.texture = load("res://UI/" + orbs_info[orb]["type"] + ".png")
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
