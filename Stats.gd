extends Node

signal death;
signal update_exp_bar(curr, next);
signal update_score(points);
signal level_up;

var max_health = 30;
var health = max_health;
var damage = 5;
var level = 1;
var next_level_exp = 100;
var curr_exp = 0;

func init(health, damage):
	self.max_health = health;
	self.damage = damage;
	self.health = max_health;

func take_damage(damage):
	health -= damage;
	print(damage)
	print(health)
	if (health <= 0):
		health = 0;
		emit_signal("death");
		print("death");

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
