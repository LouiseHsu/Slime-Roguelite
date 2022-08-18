extends YSort


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Clear all entities except player
func clear_all():
	for child in self.get_children():
		if (child.name != "Player"):
			child.queue_free();


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
