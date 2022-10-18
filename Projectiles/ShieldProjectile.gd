extends KinematicBody2D

var velocity = Vector2(0, 0);

var curr_velocity = Vector2(0, 0);

var health = 10;

func init(health):
	pass;

func _physics_process(delta):
	var player_pos = Constants.get_player().global_position;
	self.position = player_pos;

func _on_Hurtbox_area_entered(area):
	queue_free();

func _on_Timer_timeout():
	queue_free();
