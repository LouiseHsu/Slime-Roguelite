extends Node;

var fire_rate = 0;
var damage = 0;
var sprite_frame = 0;
var p_velocity = Vector2(0, 0);
var level = 1;

var active = false;
var firing_timer = 0;
var slot;
	
func init(fire_rate, damage, slot):
	self.fire_rate = fire_rate * (1 + ((level - 1) * 0.1));
	self.damage = damage * (1 + ((level - 1) * 0.1));
	self.slot = slot;
	
func activate(direction):
	self.active = true;
	self.p_velocity = direction * 100;
	
func deactivate():
	self.active = false;
	self.firing_timer = 0;
	
func level_up():
	level += 1;
	
	print(self.name)
	init(self.fire_rate, self.damage, slot);

func _physics_process(delta):
	physics_process(delta);
	
	
func physics_process(delta):
	spawn_projectiles(delta);

func spawn_projectiles(delta):
	pass;
