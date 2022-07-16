extends Node2D

const test_weapon = preload("res://Weapons/Test_Weapon.tscn");
const circle_weapon = preload("res://Weapons/Circle_Weapon.tscn");
const side_weapon = preload("res://Weapons/Side_Weapon.tscn");

onready var stats = $"../Stats"

var weapon_list = {
	"test_weapon" : false,
	"side_weapon" : false,
	"circle_weapon": false
}

func _ready():
	add_weapon("test_weapon");

func add_weapon(chosen_weapon):
	match (chosen_weapon):
		"test_weapon":
			if (weapon_list[chosen_weapon]):
				print("already here")
			else:
				weapon_list[chosen_weapon] = true;
				var weapon = test_weapon.instance();
				self.call_deferred("add_child", weapon);
				weapon.init(1, stats.damage); 
#			fire rate needs to be dynamic	:/
	match (chosen_weapon):
		"side_weapon":
			if (weapon_list[chosen_weapon]):
				print("already here")
			else:
				weapon_list[chosen_weapon] = true;
				var weapon = test_weapon.instance();
				self.call_deferred("add_child", weapon);
				weapon.init(1, stats.damage); 
	match (chosen_weapon):
		"circle_weapon":
			if (weapon_list[chosen_weapon]):
				print("already here")
			else:
				weapon_list[chosen_weapon] = true;
				var weapon = test_weapon.instance();
				self.call_deferred("add_child", weapon);
				weapon.init(1, stats.damage); 
