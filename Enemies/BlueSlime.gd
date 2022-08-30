extends "res://Enemy.gd"


# Declare member variables here. Examples:
var damage = 10;
var health = 10;
var experience = 10;
var score = 1;


# Called when the node enters the scene tree for the first time.
func init():
	stats.init(damage, health, score);
	pass # Replace with function body.

