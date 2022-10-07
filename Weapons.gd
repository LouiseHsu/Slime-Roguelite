extends Node2D

const blue_orb = preload("res://Weapons/Blue_Orb.tscn");
const shield_weapon = preload("res://Weapons/Pink_Orb.tscn");

const ALL_WEAPONS = {
	"blue_orb": blue_orb,
	"pink_orb": shield_weapon
}

var weapon_list = {
	"blue_orb": null,
	"pink_orb": null
}

func _ready():
	PlayerStats.connect("weapons_update", self, "update_weapons");
	update_weapons()

func update_weapons():
	var slot_info = PlayerStats.get_display_info()["slots"];
	
	var up_slot = slot_info[Constants.UP_ORB];

	
	for slot in slot_info.values():
		if (slot["type"] != null):
			var weapon = load("res://Weapons/" + slot["type"] + ".tscn").instance();
			self.call_deferred("add_child", weapon);
			weapon.init(slot["level"], PlayerStats.damage); 
		

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
	
