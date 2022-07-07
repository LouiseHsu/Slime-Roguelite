extends "res://Weapons/Weapon.gd"


func _physics_process(delta):
	if (self.active):
		if (firing_timer <= 0):
			var projectile = load("res://Projectile.tscn").instance();
			projectile.init(-1 * self.p_velocity, self.damage, sprite_frame);
			projectile.visible = true;
			add_child(projectile);
			projectile.transform = get_parent().global_transform;
			self.firing_timer = float(1)/self.fire_rate;
		else :
			self.firing_timer -= delta;
			
