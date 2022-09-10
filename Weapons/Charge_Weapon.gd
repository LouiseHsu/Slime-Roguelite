extends "res://Weapons/Weapon.gd"

func physics_process(delta):
	if Input.is_action_just_pressed("Charge Weapon") :
		spawn_projectiles(delta);
	$AnimatedSprite.transform = get_parent().global_transform;

func spawn_projectiles(delta):
	print("hi")
	var projectile = load("res://Projectiles/ChargedProjectile.tscn").instance();
	var curr_frame = $AnimatedSprite.frame
	projectile.init(self.p_velocity, self.damage, curr_frame);
	add_child(projectile);
	projectile.transform = get_parent().global_transform;
