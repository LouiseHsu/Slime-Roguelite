extends CanvasLayer

onready var optionscontainer = $ "MarginContainer/Background/VBoxContainer/OptionContainer"
signal chose_weapon(weapon);

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Stats_level_up():
	self.layer = 1;
	get_tree().paused = true;
	for option in optionscontainer.get_children():
		option.associate_weapon("test_weapon");
	pass

func _on_ConfirmButton_confirm(weapon):
	self.layer = -1;
	get_tree().paused = false;
	emit_signal("chose_weapon", weapon);
