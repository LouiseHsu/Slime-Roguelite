extends StaticBody2D

onready var enemy_list = $EnemyList;
onready var timer = $Timer;
onready var sprite = $Sprite;

var width = 0;
var height = 0;
var num_enemy_types = 0;
var enemy_type = 0;

var centre = Vector2.ZERO;
var type;

func init(position):
	self.global_position = position;
	
func _ready():
	width = Constants.VIEWPORT_WIDTH/2;
	height = Constants.VIEWPORT_HEIGHT/2
	
	get_random_enemy();
	
	
	var enemy = load("res://Enemies/" + enemy_type + ".tscn");
	sprite.texture = load("res://Objects/" + enemy_type + "-spawner.png")
	
	enemy = enemy.instance();
	
	enemy_list.add_child(enemy);
	
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var num = rng.randf_range(3, 6);
	
	timer.wait_time =  num
	timer.start()

func _on_Timer_timeout():
	var enemy = enemy_list.get_child(0).duplicate();
	enable_enemy(enemy);
	
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	
	var angle = rng.randf_range(0, 1) * PI * 2;

	var x = cos(angle) * 30;
	var y = sin(angle) * 30;
	
	enemy.global_position = self.global_position + Vector2(x, y);

	get_parent().add_child(enemy);

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
