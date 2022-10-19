extends Node2D

const blue_orb = preload("res://Weapons/Blue_Orb.tscn");
const pink_orb = preload("res://Weapons/Pink_Orb.tscn");
const yellow_orb = preload("res://Weapons/Yellow_Orb.tscn");

const ALL_WEAPONS = {
	"blue_orb": blue_orb,
	"pink_orb": pink_orb,
	"yellow_orb": yellow_orb
}

var weapon_list = {
	"blue_orb": null,
	"pink_orb": null,
	"yellow_orb": null,
}

func _ready():
	PlayerStats.connect("weapons_update", self, "update_weapons");
	update_weapons()

func update_weapons():
	var slot_info = PlayerStats.get_display_info()["slots"];
	Constants.delete_children(self);

	for slot in slot_info:
		var curr_slot = slot_info[slot];
		if (curr_slot["type"] != null):
			var weapon = load("res://Weapons/" + curr_slot["type"] + ".tscn").instance();
			self.call_deferred("add_child", weapon);
			print(slot)
			weapon.init(curr_slot["level"], PlayerStats.damage, slot);
		

#var slot_info = {
#"slots" : {
#		Constants.UP_ORB : {
#			"type" : Constants.BLUE_ORB,
#			"level" : 1,
#			},
#		Constants.RIGHT_ORB : {
#			"type" : null,
#			"level" : 0,
#			},
#		Constants.LEFT_ORB : {
#			"type" : null,
#			"level" : 0,
#			},
#		Constants.DOWN_ORB : {
#			"type" : null,
#			"level" : 0,
#			}
#},
#"points" : 10 
#}
	
