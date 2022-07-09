extends Button

func _ready():
	self.connect("pressed", self, "_button_pressed")
	
func _button_pressed():
	print("Hello world!")
