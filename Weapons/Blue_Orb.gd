extends "res://Weapons/Weapon.gd"

func physics_process(delta):
	
	if Input.is_action_just_pressed(slot) :
		spawn_projectiles(delta);

#func spawn_projectiles(delta):
#	var projectile = load("res://Projectiles/ChargedProjectile.tscn").instance();
#	var curr_frame = $Sprite.frame
#	projectile.init(self.p_velocity, (1 + curr_frame) * self.damage, curr_frame);
#	get_tree().get_root().get_node("World").add_child(projectile);
#	projectile.transform = $Sprite.global_transform

func spawn_projectiles(delta):
	var projectile = load("res://Projectiles/OrbitProjectile.tscn").instance();
	projectile.init(Vector2(0, 0), self.damage, self.sprite_frame);
	get_tree().get_root().get_node("World").add_child(projectile);
	var player_pos = get_parent().global_transform;
	

	projectile.transform = player_pos;
	self.firing_timer = float(1)/1;
