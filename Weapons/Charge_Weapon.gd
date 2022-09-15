extends "res://Weapons/Weapon.gd"

func physics_process(delta):
	if Input.is_action_just_pressed("Charge Weapon") :
		spawn_projectiles(delta);

func spawn_projectiles(delta):
	print("hi")
	var projectile = load("res://Projectiles/ChargedProjectile.tscn").instance();
	var curr_frame = $AnimatedSprite.frame
	projectile.init(self.p_velocity, (1 + curr_frame) * self.damage, curr_frame);
	get_tree().get_root().get_node("World").add_child(projectile);
	projectile.transform = $AnimatedSprite.global_transform