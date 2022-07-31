extends KinematicBody2D

const VELOCITY = Vector2(10, 10);

signal drop_exp(amount);
signal drop_score(amount);

onready var ai = $AI;
onready var stats = $Stats;
onready var hurtbox = $Hurtbox;
onready var animation = $AnimationPlayer;

func _ready():
	stats.connect("death", self, "on_death");
	self.connect('drop_exp', get_parent().get_node("Player"), "killed_enemy");
	self.connect('drop_score', get_parent().get_node("ScoreUI"), "update_score");
	
	
	animation.play("Neutral")
	stats.init(10, 3);
	hurtbox.damage = stats.damage;

func _physics_process(delta):
	move_and_slide(ai.get_next_direction() * VELOCITY)

func on_death():
	emit_signal("drop_exp", 20);
	emit_signal("drop_score", 1);
	queue_free();

func _on_Hitbox_area_entered(area):
	if (area.has_method("get_damage")):
		stats.take_damage(area.damage);
		
	pass 
