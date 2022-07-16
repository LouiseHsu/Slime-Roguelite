extends Node;

onready var sprite = $Projectile/Sprite;

var fire_rate = 0;
var damage = 0;
var sprite_frame = 0;
var p_velocity = Vector2(0, 0);
var level = 1;

var active = false;
var firing_timer = 0;


func _ready():
	self.sprite_frame = sprite.frame;
	
func init(fire_rate, damage):
	self.fire_rate = fire_rate * (1 + ((level - 1) * 0.1));
	self.damage = damage * (1 + ((level - 1) * 0.1));
	
func activate(direction):
	self.active = true;
	self.p_velocity = direction * 100;
	
func deactivate():
	self.active = false;
	self.firing_timer = 0;
	
func level_up():
	level+= 1;
	init(self.fire_rate, self.damage);

func _physics_process(delta):
	spawn_projectiles(delta);
	
func spawn_projectiles(delta):
	if (self.active):
		if (firing_timer <= 0):
			var projectile = load("res://Projectiles/Projectile.tscn").instance();
			projectile.init(self.p_velocity, self.damage, sprite_frame);
			add_child(projectile);
			projectile.transform = get_parent().global_transform;
			self.firing_timer = float(1)/self.fire_rate;
		else :
			self.firing_timer -= delta;	
