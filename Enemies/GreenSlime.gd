extends "res://Enemy.gd"


# Declare member variables here. Examples:
var damage = 5;
var health = 20;
var experience = 10;
var score = 3;


# Called when the node enters the scene tree for the first time.
func init():
	stats.init(damage, health, score);
	pass # Replace with function body.
