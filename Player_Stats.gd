extends Node

signal death;
signal update_exp_bar(curr, next);
signal update_score(points);
signal update_health_bar;
signal level_up;
signal weapons_update;

var max_health = 40;
var damage = 10;
var level = 1;
var next_level_exp = 100;
var curr_exp = 0;

var health = max_health;

var owned_weapons = [];

var slot_info = {
"slots" : {
		Constants.UP_ORB : {
			"type" : Constants.BLUE_ORB,
			"level" : 1,
			},
		Constants.RIGHT_ORB : {
			"type" : null,
			"level" : 0,
			},
		Constants.LEFT_ORB : {
			"type" : null,
			"level" : 0,
			},
		Constants.DOWN_ORB : {
			"type" : null,
			"level" : 0,
			}
},
"points" : 10 
}
	
func add_weapon(weapon):
	var wep_struct = {
		"name" : weapon,
		"level" : 1
	}
	
	owned_weapons.append(wep_struct);
	emit_signal("weapons_update");

func take_damage(damage):
	health -= damage;
	if (health <= 0):
		health = 0;
	emit_signal("update_health_bar");
	return health;
	
func reset_health():
	health = max_health;
	emit_signal("update_health_bar");

func gain_exp(experience):
	curr_exp += experience;
	if (curr_exp > next_level_exp):
		level += 1;
		emit_signal("level_up");
		curr_exp -= next_level_exp;
		next_level_exp = level * 100;
	emit_signal("update_exp_bar", curr_exp, next_level_exp)
	emit_signal("update_score", experience);
#	CHANGE SO THAT THERE MAX EXP FOR EASIER BAR SETTING

func set_display_info(info):
	slot_info = info;
	emit_signal("weapons_update");
	print(info)
	pass;

func get_display_info():
	return slot_info;
