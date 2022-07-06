extends KinematicBody2D

onready var animationPlayer = $AnimationPlayer;
onready var skill = $Apple_Weapon;
onready var skill2 = $Mushroom_Weapon;
onready var stats = $Stats;

signal damage_taken;
signal player_ready;
signal level_up;

var State = {
	direction = DOWN,
	velocity = Vector2(0, 0)
}

enum {
	UP,
	DOWN,
	LEFT,
	RIGHT
}

const Direction = [
	Vector2(0, -1), 
	Vector2(0, 1), 
	Vector2(-1, 0), 
	Vector2(1, 0)
];

const top_speed = 50;

# Called when the node enters the scene tree for the first time.
func _ready():
	stats.init(10, 5); # health, damage
	skill.init(1, stats.damage, 6);  # fire rate, damage 
	skill2.init(3, stats.damage, 19);  # fire rate, damage, sprite frame
	# should i make a seperate player stats that reads from a json?
	stats.connect("death", self, "on_death");
	emit_signal("player_ready");
	pass 

func _physics_process(delta):
	handle_input();
	handle_movement();
	handle_animation();
	
func handle_input():
	
	if Input.is_action_pressed("Attack") :
		skill.activate(Direction[State.direction]);
		skill2.activate(Direction[State.direction]);
	else :
		skill.deactivate();
		skill2.deactivate();
	
func handle_movement():
	var temp_velocity = Vector2(0, 0);
	if Input.is_action_pressed("Down") :
		temp_velocity = top_speed * Direction[DOWN];
		State.direction = DOWN;
	if Input.is_action_pressed("Up") :
		temp_velocity = top_speed * Direction[UP];
		State.direction = UP;
	if Input.is_action_pressed("Left") :
		temp_velocity = top_speed * Direction[LEFT];
		State.direction = LEFT;
	if Input.is_action_pressed("Right") :
		temp_velocity = top_speed * Direction[RIGHT];
		State.direction = RIGHT;
	
	State.velocity = move_and_slide(temp_velocity);

func handle_animation():
	if (State.direction == DOWN):
		if (State.velocity == Vector2.ZERO):
			animationPlayer.play("Standing-Down");
		else :
			animationPlayer.play("Running-Down");
	elif (State.direction == UP):
		if (State.velocity == Vector2.ZERO):
			animationPlayer.play("Standing-Up");
		else :
			animationPlayer.play("Running-Up");
	elif (State.direction == LEFT):
		if (State.velocity == Vector2.ZERO):
			animationPlayer.play("Standing-Left");
		else :
			animationPlayer.play("Running-Left");
	elif (State.direction == RIGHT):
		if (State.velocity == Vector2.ZERO):
			animationPlayer.play("Standing-Right");
		else :
			animationPlayer.play("Running-Right");
			
func _on_Hitbox_area_entered(area):
	if (area.has_method("get_damage")):
		stats.take_damage(area.get_damage());
		emit_signal("damage_taken");
		
func killed_enemy(experience):
	stats.gain_exp(experience);


func get_health():
	return stats.health;
	
func get_max_health():
	return stats.max_health;

func on_death():
	print("hiiiii")
	queue_free();



func _on_Stats_level_up():
	pass # Replace with function body.
