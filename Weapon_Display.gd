extends CanvasLayer

onready var container = $ "MarginContainer/VBoxContainer/HBoxContainer";



func _ready():
	PlayerStats.connect("weapons_update", self, "render_weapons");
	self.call_deferred("render_weapons")
#	_on_Player_Stats_weapons_update()
	
func render_weapons():
	
	Constants.delete_children(container);
	for weapon in PlayerStats.owned_weapons:
		print("HEWWWWWoooooWWWWP")
		var texture = TextureButton.new();
		texture.texture_normal = load("res://UI/" + weapon["name"] + ".png");
		container.add_child(texture)
