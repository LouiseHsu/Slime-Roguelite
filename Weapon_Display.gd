extends CanvasLayer

onready var container = $ "MarginContainer/VBoxContainer/HBoxContainer";

func _ready():
	PlayerStats.connect("weapons_update", self, "render_weapons");
	self.call_deferred("render_weapons")
	 
func render_weapons():
	Constants.delete_children(container);
	var info = PlayerStats.get_display_info();
	var slots = info["slots"]
	
	var up_texture = TextureButton.new();
	if (slots[Constants.UP_ORB]["type"] != null):
		up_texture.texture_normal = load("res://UI/" + slots[Constants.UP_ORB]["type"] + ".png");
	container.add_child(up_texture)
	
	var right_texture = TextureButton.new();
	if (slots[Constants.RIGHT_ORB]["type"] != null):
		right_texture.texture_normal = load("res://UI/" + slots[Constants.RIGHT_ORB]["type"] + ".png");
	container.add_child(right_texture)
	
	var left_texture = TextureButton.new();
	if (slots[Constants.LEFT_ORB]["type"] != null):
		left_texture.texture_normal = load("res://UI/" + slots[Constants.LEFT_ORB]["type"] + ".png");
	container.add_child(left_texture)
	
	var down_texture = TextureButton.new();
	if (slots[Constants.DOWN_ORB]["type"] != null):
		down_texture.texture_normal = load("res://UI/" + slots[Constants.DOWN_ORB]["type"] + ".png");
	container.add_child(down_texture)
