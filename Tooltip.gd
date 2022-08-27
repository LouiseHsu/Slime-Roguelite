extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var tip = $ToolTipLabel
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Control_mouse_entered():
	print("mouse entered")
	tip.visible = true;
	pass # Replace with function body.


func _on_Control_mouse_exited():
	print("mouse exited")
	tip.visible = false;
	pass # Replace with function body.
