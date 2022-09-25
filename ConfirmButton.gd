extends Button

signal confirm(weapon);
var weapon_chose;

func _ready():
	self.connect("pressed", self, "_button_pressed")

func _button_pressed():
	emit_signal("confirm", weapon_chose);

func _on_Option_1_upgrade(weapon):
	self.weapon_chose = weapon;

func _on_Option_2_upgrade(weapon):
	self.weapon_chose = weapon;

func _on_Option_3_upgrade(weapon):
	self.weapon_chose = weapon;
