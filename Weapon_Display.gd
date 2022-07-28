extends CanvasLayer

onready var container = $ "MarginContainer/VBoxContainer/HBoxContainer";

func _ready():
	var sprite = Sprite.new();
	sprite.texture = load("res://UI/Circle_Weapon.png");
	container.add_child(sprite)
