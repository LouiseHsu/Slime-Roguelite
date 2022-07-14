extends "res://Projectiles/Projectile.gd"
var angle = 0;

func _physics_process(delta):
	var player_pos = get_parent().get_parent().global_position;
	angle = angle + delta;
	
	player_pos= Vector2(player_pos[0] + cos(angle)*30, player_pos[1] + sin(angle)*30)
	self.position = player_pos;
	
	var pos_diff = (player_pos - self.global_position);
	var direction = pos_diff.normalized();
	
	move_and_slide(direction * Vector2(0.1, 0.1))
