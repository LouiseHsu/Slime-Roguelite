extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var velocity = Vector2(0, 0);

var curr_velocity = Vector2(0, 0);

var damage = 0;

func init(velocity, damage, frame):
	self.velocity = velocity;
	self.damage = damage;
	print(damage);
	$Hurtbox.init(damage) 
	$Sprite.frame = frame;

func _physics_process(delta):
	curr_velocity = move_and_slide(velocity);

func _on_Hurtbox_area_entered(area):
	print("destroyed")
	queue_free();
	pass # Replace with function body.
