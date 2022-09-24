extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# dict of 4 items - north east south west orbs
# for each orb, we need to know it's type and level, and if its unlocked

onready var buttonGridContainer = $MarginContainer/TextureRect/ButtonGridContainer
onready var displayGridContainer = $MarginContainer/TextureRect/DisplayGridContainer
onready var pointDisplay = $MarginContainer/TextureRect/PointDisplay
var display_info;
#var display_info = {
#	"orbs" : [
#		{
#			Constants.UP_ORB : {
#				"type" : Constants.PINK_ORB,
#				"level" : 2,
#				}
#		},
#		{
#			Constants.RIGHT_ORB : {
#				"type" : Constants.BLUE_ORB,
#				"level" : 1,
#					}
#		},
#		{
#			Constants.LEFT_ORB : {
#				"type" : null,
#				"level" : 0,
#					}
#		},
#		{
#			Constants.DOWN_ORB : {
#				"type" : null,
#				"level" : 0,
#					}
#		}
#	],
#	"points" : 2 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func set_display_info(info):
	print("hurehruehruehruehruhewr")
	display_info = info;
	update_display()
	
func update_display():
	var slots = display_info["orbs"];
	for slot in slots:
		
		var slot_name = slot.keys()[0];
		var button = buttonGridContainer.get_node(slot_name + "OrbButton")
		var display = displayGridContainer.get_node(slot_name + "OrbDisplay")
		
		var orb_info = slot[slot_name];
		
		if (orb_info["level"] == 0):
			display.texture = load("res://UI/" + "lock" + ".png")
			
			button.texture_normal = load("res://UI/" + "unlock-enabled" + ".png")
			button.texture_pressed = load("res://UI/" + "unlock-pressed" + ".png")
			button.texture_disabled = load("res://UI/" + "unlock-disabled" + ".png")
			
		else:
			display.texture = load("res://UI/" + orb_info["type"] + ".png")
			button.texture_normal = load("res://UI/" + "upgrade-enabled" + ".png")
			button.texture_pressed = load("res://UI/" + "upgrade-pressed" + ".png")
			button.texture_disabled = load("res://UI/" + "upgrade-disabled" + ".png")
			
		pointDisplay.bbcode_text = "[center]" + str(display_info["points"]) + "[center]"
			


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
