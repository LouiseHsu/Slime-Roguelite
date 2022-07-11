extends KinematicBody2D

var velocity = Vector2(0, 0);

var curr_velocity = Vector2(0, 0);

var damage = 0;

func init(velocity, damage, frame):
	self.velocity = velocity;
	self.damage = damage;
	$Hurtbox.init(damage) 
	$Sprite.frame = frame;
	self.visible = true;

func _physics_process(delta):
	curr_velocity = move_and_slide(velocity);

func _on_Hurtbox_area_entered(area):
	queue_free();

func _on_Timer_timeout():
	queue_free();
