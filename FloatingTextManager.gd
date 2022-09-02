extends Node2D

var FCT = preload("res://FloatingText.tscn")

export var travel = Vector2(0, -80)
export var duration = 2
export var spread = PI/2

var deleting = false;

func _process(delta):
	if deleting == true:
		if self.get_children().size() == 0:
			get_parent().queue_free();

func show_value(value, crit=false):
	var fct = FCT.instance()
	add_child(fct)
	fct.show_value(str(value), travel, duration, spread, crit)

func delete():
	deleting = true;
