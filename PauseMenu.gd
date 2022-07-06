extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var control = $Control;
# Called when the node enters the scene tree for the first time.
func _ready():
	pause_mode = PAUSE_MODE_PROCESS;
	control.visible = false;
	
func _process(delta):
	if Input.is_action_just_pressed("Escape"):
		get_tree().paused = !get_tree().paused;
		control.visible = !control.visible;
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
