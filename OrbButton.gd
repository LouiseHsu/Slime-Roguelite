extends TextureButton

signal button_pressed;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _pressed():
	emit_signal("button_pressed")
