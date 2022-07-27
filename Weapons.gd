extends Node2D

const front_weapon = preload("res://Weapons/front_weapon.tscn");
const circle_weapon = preload("res://Weapons/Circle_Weapon.tscn");
const side_weapon = preload("res://Weapons/Side_Weapon.tscn");

const ALL_WEAPONS = {
	"front_weapon" : front_weapon,
	"side_weapon" : side_weapon,
	"circle_weapon": circle_weapon
}

var weapon_list = {
	"front_weapon" : null,
	"side_weapon" : null,
	"circle_weapon": null
}

func _ready():
	add_weapon("front_weapon");

func add_weapon(chosen_weapon):
	if (weapon_list[chosen_weapon]):
		weapon_list[chosen_weapon].level_up();
		
	else:
		var weapon = ALL_WEAPONS[chosen_weapon].instance();
		self.call_deferred("add_child", weapon);
		PlayerStats.add_weapon(chosen_weapon);
		weapon.init(1, PlayerStats.damage); 
		weapon_list[chosen_weapon] = weapon;
