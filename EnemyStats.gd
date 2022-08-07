extends Node

signal death;
signal update_exp_bar(curr, next);
signal level_up;

export var max_health = 0;
var health = 0;
export var damage = 5;
var level = 1;
var next_level_exp = 100;
var curr_exp = 0;

func init(health, damage):
	self.max_health = health;
	self.damage = damage;
	self.health = max_health;

func set_max_health(health):
	self.max_health = health;
	self.health = self.max_health;

func take_damage(damage):
	health -= damage;
	if (health <= 0):
		health = 0;
		emit_signal("death");

