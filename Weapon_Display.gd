extends CanvasLayer

onready var container = $ "MarginContainer/VBoxContainer/HBoxContainer";

func _ready():
	PlayerStats.connect("weapons_update", self, "render_weapons");

	
func render_weapons():
	
	Constants.delete_children(container);
	for weapon in PlayerStats.owned_weapons:
		print("HEWWWWWoooooWWWWP")
		var texture = TextureButton.new();
		texture.texture_normal = load("res://UI/" + weapon["name"] + ".png");
		container.add_child(texture)

func _on_Player_Stats_weapons_update():
	print("hi 3333")
	print("HEWWWWWWWWWWWWWWWWWWWWWWP")
	for weapon in PlayerStats.owned_weapons:
		var sprite = Sprite.new();
		sprite.texture = load("res://UI/" + weapon["name"] + ".png");
		sprite.scale = 0.25;
		container.add_child(sprite)
