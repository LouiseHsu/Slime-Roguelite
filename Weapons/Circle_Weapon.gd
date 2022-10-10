extends "res://Weapons/Weapon.gd"
func _physics_process(delta):
	spawn_projectiles(delta);
			
func spawn_projectiles(delta):
	if (self.active):
		if (self.firing_timer <= 0):
			
			var projectile = load("res://Projectiles/OrbitProjectile.tscn").instance();
			projectile.init(Vector2(0, 0), self.damage, self.sprite_frame);
			add_child(projectile);
			var player_pos = Constants.get_player().global_transform;
			

			projectile.transform = player_pos;
			self.firing_timer = float(1)/1;
		else :
			self.firing_timer -= delta;
