extends CanvasLayer

onready var option1 = $ "MarginContainer/Background/VBoxContainer/OptionContainer/Option 1"
onready var option2 = $ "MarginContainer/Background/VBoxContainer/OptionContainer/Option 2"
onready var option3 = $ "MarginContainer/Background/VBoxContainer/OptionContainer/Option 3"
signal chose_weapon(weapon);

func _ready():

	self.get_child(0).visible = false;
	pass

func _on_ConfirmButton_confirm(weapon):
	self.layer = -1;
	self.get_child(0).visible = false;
	get_tree().paused = false;
	emit_signal("chose_weapon", weapon);

func get_3_random_weapons():
	var list = range(0,Constants.WEAPONS_LIST.size())
	var sample = []
	
	for i in range(3):
		var rng = RandomNumberGenerator.new()
		rng.randomize()
		var random_num = rng.randi_range(0, list.size() - 1)
		
		var x = Constants.WEAPONS_LIST[list[random_num]];
		sample.append(x)
		list.remove(random_num)

	return sample;


func _on_Player_Stats_level_up():
	print("hello")
		# bring level up menu to the front and unhide
	self.layer = 5;
	self.get_child(0).visible = true;
	
	# pause processes not in menu
	get_tree().paused = true;
	
	var weapon_options = get_3_random_weapons();
	
	option1.associate_weapon(weapon_options[0]);
	option2.associate_weapon(weapon_options[1]);
	option3.associate_weapon(weapon_options[2]);
	
	option1.icon = load("res://UI/" + weapon_options[0] + ".png")
	option2.icon = load("res://UI/" + weapon_options[1] + ".png")
	option3.icon = load("res://UI/" + weapon_options[2] + ".png")
