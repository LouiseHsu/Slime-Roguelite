extends Camera2D

var curr_position = Vector2(0, 0);

signal camera_pos(pos);

func _process(delta):
	if (curr_position != self.global_position):
		curr_position = self.global_position
		
		emit_signal("camera_pos", curr_position);
	
