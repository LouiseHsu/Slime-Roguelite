extends Area2D

var damage = 0;

func init(damage):
	self.damage = damage;

func get_damage():
	return damage;
