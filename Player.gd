extends KinematicBody2D

onready var animationPlayer = $AnimationPlayer;
onready var effects = $Effects;
onready var weapons = $Weapons;
onready var invincibility_timer = $Invincibility;

signal damage_taken;
signal player_ready;
signal level_up;

var State = {
	direction = DOWN,
	velocity = Vector2(0, 0),
	status = Status.NORMAL
}

var bodies_in_collision = [];
var is_invincible = false;

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

enum Status {
	NORMAL,
	INVINCIBLE
}


const top_speed = 50;

func _ready():
	emit_signal("player_ready");

func init_at(position):
	PlayerStats.reset_health();
	self.global_position = position;
	State.direction = DOWN

func _physics_process(delta):
	handle_movement();
	handle_animation();
	activate_weapons();
	take_damage();
	handle_state();
	
func handle_state():
	match (State.status):
		Status.NORMAL:
			pass;
		Status.INVINCIBLE:
			if (invincibility_timer.time_left <= 0):
				State.status = Status.NORMAL;
				effects.stop()
				pass;
	pass;
	
func activate_weapons():
	for w in weapons.get_children():
		w.activate(Direction[State.direction]);
	
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
		bodies_in_collision.append(area);
		
func _on_Hitbox_area_exited(area):
	if (area.has_method("get_damage")):
		bodies_in_collision.remove(bodies_in_collision.find(area));
		
func take_damage():
	if (bodies_in_collision.size() > 0):
		if (State.status == Status.INVINCIBLE):
			return;
		else: 
			var health = 0;
			for body in bodies_in_collision:
				health = PlayerStats.take_damage(bodies_in_collision[0].get_damage());
				if (health == 0) :
					on_death();
				else :
					set_invincibility()
			
func set_invincibility():
	invincibility_timer.start();
	effects.play("Invincibility");
	State.status = Status.INVINCIBLE;
		
func killed_enemy(experience):
	PlayerStats.gain_exp(experience);

func on_death():
	queue_free();
	get_tree().reload_current_scene();
	
func _on_LevelUpMenu_chose_weapon(chosen_weapon):
	weapons.add_weapon(chosen_weapon);
