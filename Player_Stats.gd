extends Node

signal death;
signal update_exp_bar(curr, next);
signal update_score(points);
signal level_up;
signal weapons_update;

var max_health = 30;
var damage = 10;
var level = 1;
var next_level_exp = 100;
var curr_exp = 0;

var health = max_health;

var owned_weapons = [];

func add_weapon(weapon):
	var wep_struct = {
		"name" : weapon,
		"level" : 1
	}
	
	owned_weapons.append(wep_struct);
	emit_signal("weapons_update");
	print(owned_weapons);

func level_up_weapon(weapon):
	for wep in owned_weapons :
		if (weapon == wep["name"]) :
			wep["level"] = wep["level"] + 1;
			emit_signal("weapons_update");


	print(owned_weapons);


func take_damage(damage):
	health -= damage;
	if (health <= 0):
		health = 0;
	return health;

func gain_exp(experience):
	curr_exp += experience;
	print("hehehehe")
	if (curr_exp > next_level_exp):
		level += 1;
		emit_signal("level_up");
		curr_exp -= next_level_exp;
		next_level_exp = level * 100;
	emit_signal("update_exp_bar", curr_exp, next_level_exp)
	emit_signal("update_score", experience);
#	CHANGE SO THAT THERE MAX EXP FOR EASIER BAR SETTING
