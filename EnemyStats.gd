extends Node

signal death;
signal update_exp_bar(curr, next);
signal level_up;

export var max_health = 0;
var health = 0;
export var damage = 5;
var dropped_exp = 10
var dropped_score = 0



func init(health, damage, score):
	self.max_health = health;
	self.damage = damage;
	self.health = max_health;
	self.dropped_score = score;
	self.dropped_exp = score * 10;

func update_stats(health, damage):
	self.max_health = health;
	self.health = self.max_health;
	self.damage = damage;

func take_damage(damage):
	health -= damage;
	if (health <= 0):
		health = 0;
		emit_signal("death");

