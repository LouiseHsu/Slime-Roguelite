extends "res://Weapons/Weapon.gd"

func _physics_process(delta):
	spawn_projectiles(delta);
			
func spawn_projectiles(delta):
	if (self.active):
		if (firing_timer <= 0):
			var projectile = load("res://Projectile.tscn").instance();
			projectile.init(Vector2(self.p_velocity[1], self.p_velocity[0]), self.damage, sprite_frame);
			add_child(projectile);
			projectile.transform = get_parent().global_transform;
			var projectile2 = load("res://Projectile.tscn").instance();
			projectile2.init(Vector2(-1 * self.p_velocity[1], -1 * self.p_velocity[0]), self.damage, sprite_frame);
			add_child(projectile2);
			projectile2.transform = get_parent().global_transform;
			self.firing_timer = float(1)/self.fire_rate;
			
		else :
			self.firing_timer -= delta;
