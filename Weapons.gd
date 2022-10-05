extends Node2D

const front_weapon = preload("res://Weapons/front_weapon.tscn");
const circle_weapon = preload("res://Weapons/Circle_Weapon.tscn");
const side_weapon = preload("res://Weapons/Side_Weapon.tscn");
const charge_weapon = preload("res://Weapons/Charge_Weapon.tscn");
const shield_weapon = preload("res://Weapons/shield_weapon.tscn");

const ALL_WEAPONS = {
	"front_weapon" : front_weapon,
	"side_weapon" : side_weapon,
	"circle_weapon": circle_weapon,
	"charge_weapon": charge_weapon,
	"shield_weapon": shield_weapon
}

var weapon_list = {
	"front_weapon" : null,
	"side_weapon" : null,
	"circle_weapon": null,
	"charge_weapon": null,
	"shield_weapon": null
}

func _ready():
	add_weapon("charge_weapon");
	add_weapon("shield_weapon");
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
