extends StaticBody2D

onready var enemy_list = $EnemyList;
onready var timer = $Timer;
onready var sprite = $Sprite
onready var stats = $Stats;

signal spawner_destroyed;

var width = 0;
var height = 0;
var num_enemy_types = 0;
var enemy_type = 0;
var health = 100;
var doppelganger;
var curr_difficulty = 0;

var centre = Vector2.ZERO;
var type;

func init(position):
	self.global_position = position;
	
func _ready():
	width = Constants.VIEWPORT_WIDTH/2;
	height = Constants.VIEWPORT_HEIGHT/2
	
#	Set enemy type for this spawner + set enemy and sprite
	get_random_enemy();
	var enemy = load("res://Enemies/" + enemy_type + ".tscn");
	sprite.texture = load("res://Objects/" + enemy_type + "-spawner.png")
	
#	add the mother monster from which we clone slimes, save reference
	enemy = enemy.instance();
	enemy_list.add_child(enemy);
	doppelganger = enemy_list.get_child(0)

#	set random period between slime spawning + start timer
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var num = rng.randf_range(3, 6);
	
	timer.wait_time = num
	timer.start()

func _process(delta):
	
	# set scaling difficulty
	if (OS.get_ticks_msec()/1000 > (curr_difficulty * 5)):
		curr_difficulty += 1;
		doppelganger.update_stats(int(doppelganger.stats.health * 1.1), int(doppelganger.stats.damage * 1.1));


func _on_Timer_timeout():
	# get a copy of the enemy
	var enemy = enemy_list.get_child(0).duplicate();
	
	enable_enemy(enemy);

	# get spawn point
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var angle = rng.randf_range(0, 1) * PI * 2;
	
	var x = cos(angle) * 30;
	var y = sin(angle) * 30;
	enemy.global_position = self.global_position + Vector2(x, y);
	
	get_parent().add_child(enemy);	
	enemy.update_stats(doppelganger.stats.health, doppelganger.stats.damage)
	print(doppelganger.stats.health)
	
func get_random_enemy():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var num = rng.randi_range(0, Constants.ENEMYS_LIST.size() - 1);
	enemy_type = Constants.ENEMYS_LIST[num];
	
func _on_Camera2D_camera_pos(pos):
	centre = pos;
	
func disable_enemy(enemy):
	enemy.get_node("Hitbox/CollisionShape2D").disabled = true;
	enemy.get_node("Hurtbox/Collision").disabled = true;
	enemy.get_node("PhysicalHitbox").disabled = true;
	enemy.visible = false;
	
func enable_enemy(enemy):
	enemy.get_node("Hitbox/CollisionShape2D").disabled = false;
	enemy.get_node("Hurtbox/Collision").disabled = false;
	enemy.get_node("PhysicalHitbox").disabled = false;
	enemy.visible = true;

func take_damage(damage):
	health -= damage;
	if (health <= 0):
		health = 0;
		emit_signal("spawner_destroyed");
		queue_free();

func _on_Hitbox_area_entered(area):
	if (area.has_method("get_damage")):
		take_damage(area.damage);
