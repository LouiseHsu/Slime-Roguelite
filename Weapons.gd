extends Node2D

const blue_orb = preload("res://Weapons/Blue_Orb.tscn");
const shield_weapon = preload("res://Weapons/Shield_Weapon.tscn");

const ALL_WEAPONS = {
	"blue_orb": blue_orb,
	"shield_weapon": shield_weapon
}

var weapon_list = {
	"blue_orb": null,
	"shield_weapon": null
}

func _ready():
	
#	add_weapon("blue_orb");
#	add_weapon("shield_weapon");
	update_weapons()
	print("added first weapon")

func add_weapon(chosen_weapon):
	if (weapon_list[chosen_weapon]):
		weapon_list[chosen_weapon].level_up();
		PlayerStats.level_up_weapon(chosen_weapon);
		
	else:
		var weapon = ALL_WEAPONS[chosen_weapon].instance();
		self.call_deferred("add_child", weapon);
		weapon.init(1, PlayerStats.damage); 
		
		PlayerStats.add_weapon(chosen_weapon);
		print("shouldve hit here")
		weapon_list[chosen_weapon] = weapon;
		
func update_weapons():
	var slot_info = PlayerStats.get_display_info()["slots"];
	
	var up_slot = slot_info[Constants.UP_ORB];
	
	var weapon = load("res://Weapons/" + up_slot["type"] + ".tscn").instance();
	self.call_deferred("add_child", weapon);
	weapon.init(1, PlayerStats.damage); 
	
	

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
	
