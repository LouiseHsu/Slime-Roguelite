extends Button

signal upgrade(weapon)

var weapon;

func associate_weapon(weapon):
	self.weapon = weapon;
	
func _ready():
	self.connect("pressed", self, "_button_pressed")
	
func _button_pressed():
	print(weapon);
	emit_signal("upgrade", weapon);
	

	
