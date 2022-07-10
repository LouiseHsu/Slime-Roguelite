extends CanvasLayer

onready var optionscontainer = $ "MarginContainer/Background/VBoxContainer/OptionContainer"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Stats_level_up():
	self.layer = self.layer * -1;
	
	
	for option in optionscontainer.get_children():
		
		option.associate_weapon(randi()%10+1);
	
	pass # Replace with function body.
