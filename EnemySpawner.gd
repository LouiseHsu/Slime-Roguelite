extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var enemy = preload("res://Enemy.tscn");


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	var e = enemy.instance();
	e.global_position = Vector2(20, 20);
	# 0, -1 < x, y < 200, -1
	# -1, 0 < x, y < -1, 200
	# 0, 201 < x, y < 200, 201
	# 201, 200 < x, y < 201, 0
	
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var num = rng.randi_range(0, 4)
	
	var spawn_side = [Vector2(rng.randi_range(0, 320), -1), Vector2(-1, rng.randi_range(0, 180)), Vector2(rng.randi_range(0, 320), 181), Vector2(320, rng.randi_range(0, 181))]
	
	e.global_position = spawn_side[randi() % spawn_side.size()];
	
	get_parent().add_child(e);
	pass # Replace with function body.
	

