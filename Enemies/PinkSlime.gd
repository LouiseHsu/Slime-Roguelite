extends "res://Enemy.gd"

# Declare member variables here. Examples:
var damage = 2;
var health = 30;
var experience = 10;
var score = 2


# Called when the node enters the scene tree for the first time.
func init():
	stats.init(damage, health, score);
	pass # Replace with function body.
