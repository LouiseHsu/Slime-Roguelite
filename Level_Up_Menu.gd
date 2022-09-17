extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# dict of 4 items - north east south west orbs
# for each orb, we need to know it's type and level, and if its unlocked

var orb_info = {
	"North" : {
		"type" : Constants.PINK_ORB,
		"level" : 1,
		"unlocked" : true
	},
	"East" : {
		"type" : Constants.PINK_ORB,
		"level" : 1,
		"unlocked" : true
	},
	"South" : {
		"type" : Constants.PINK_ORB,
		"level" : 1,
		"unlocked" : true
	},
	"West" : {
		"type" : Constants.PINK_ORB,
		"level" : 1,
		"unlocked" : true
	}
}
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
