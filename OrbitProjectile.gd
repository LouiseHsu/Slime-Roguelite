extends "res://Projectiles/Projectile.gd"
var angle = 0;

func _physics_process(delta):
	print(Constants.get_player().name)
	var player_pos = Constants.get_player().global_position;
	angle = angle + delta * 2;
	
	player_pos= Vector2(player_pos[0] + cos(angle)*30, player_pos[1] + sin(angle)*30)
	self.position = player_pos;
	
	var pos_diff = (player_pos - self.global_position);
	var direction = pos_diff.normalized();

