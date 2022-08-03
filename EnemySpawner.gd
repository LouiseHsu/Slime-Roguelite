extends StaticBody2D

onready var enemy_list = $EnemyList;
onready var timer = $Timer;

var width = 0;
var height = 0;
var num_enemy_types = 0;
var enemy_type = 0;

var centre = Vector2.ZERO;
var type;

func init(position):
	
	self.global_position = position;
	print(global_position)
	
func _ready():
	width = Constants.VIEWPORT_WIDTH/2;
	height = Constants.VIEWPORT_HEIGHT/2
	print("hewwo")
	
	get_random_enemy();
	
	var enemy = load(Constants.ENEMYS_LIST[enemy_type]);
	
	enemy = enemy.instance();
	
	enemy_list.add_child(enemy);
	timer.start()

func _on_Timer_timeout():
	print("hewwo")
	var enemy = enemy_list.get_child(0).duplicate();
	enable_enemy(enemy);
	enemy.global_position = self.global_position + Vector2(0, 10);
	get_parent().add_child(enemy);

func get_random_enemy():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var num = rng.randi_range(0, Constants.ENEMYS_LIST.size() - 1);
	enemy_type = num;
	
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
