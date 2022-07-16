extends CanvasLayer

onready var optionscontainer = $ "MarginContainer/Background/VBoxContainer/OptionContainer"
signal chose_weapon(weapon);

func _ready():
	pass

func _on_Stats_level_up():
	self.layer = 1;
	get_tree().paused = true;
	optionscontainer.get_children()[0].associate_weapon("side_weapon");
	optionscontainer.get_children()[1].associate_weapon("circle_weapon");
	optionscontainer.get_children()[2].associate_weapon("test_weapon");


func _on_ConfirmButton_confirm(weapon):
	self.layer = -1;
	get_tree().paused = false;
	emit_signal("chose_weapon", weapon);
