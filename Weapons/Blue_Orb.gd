extends "res://Weapons/Weapon.gd"

func physics_process(delta):
	
	if Input.is_action_just_pressed(slot) :
		spawn_projectiles(delta);

func spawn_projectiles(delta):
	var projectile = load("res://Projectiles/ShieldProjectile.tscn").instance();
	get_tree().get_root().get_node("World").add_child(projectile);
	projectile.transform = $Sprite.global_transform

