extends Node

onready var player = get_tree().get_nodes_in_group("Player")[0]

func get_next_direction():
	var pos_diff = (player.global_position - get_parent().global_position);
	var direction = pos_diff.normalized();
	return direction;
