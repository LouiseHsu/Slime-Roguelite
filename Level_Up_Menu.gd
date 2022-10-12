extends CanvasLayer

onready var buttonGridContainer = $MarginContainer/TextureRect/ButtonGridContainer
onready var displayGridContainer = $MarginContainer/TextureRect/DisplayGridContainer
onready var pointDisplay = $MarginContainer/TextureRect/PointDisplay
var display_info = {
	"slots" : {
			Constants.UP_ORB : {
				"type" : null,
				"level" : 0,
				},
			Constants.RIGHT_ORB : {
				"type" : Constants.BLUE_ORB,
				"level" : 1,
				},
			Constants.LEFT_ORB : {
				"type" : null,
				"level" : 0,
				},
			Constants.DOWN_ORB : {
				"type" : null,
				"level" : 0,
				}
	},
	"points" : 2 
	}

signal close;

# Called when the node enters the scene tree for the first time.
func _ready():
	for button in buttonGridContainer.get_children():
		button.connect("pressed", self, "_on_Slot_Button_Pressed", [button])
	
	update_display()
	pass # Replace with function body.
	
func get_updated_info():
	return display_info;
	
func set_display_info(info):
	display_info = info;
	update_display()
	
func update_display():
	var slots = display_info["slots"];
	for slot in slots.keys():

		var button = buttonGridContainer.get_node(slot + "Button")
		var display = displayGridContainer.get_node(slot + "Display")
		
		var orb_info = slots[slot];
		
		if (orb_info["level"] == 0):
			display.texture = load("res://UI/" + "lock" + ".png")
			
			button.texture_normal = load("res://UI/" + "unlock-enabled" + ".png")
			button.texture_pressed = load("res://UI/" + "unlock-pressed" + ".png")
			button.texture_disabled = load("res://UI/" + "unlock-disabled" + ".png")
			
		else:
			display.texture = load("res://UI/" + orb_info["type"] + ".png")
			display.get_node("RichTextLabel").bbcode_text = "[center]" + str(orb_info["level"]) + "[center]"
			button.texture_normal = load("res://UI/" + "upgrade-enabled" + ".png")
			button.texture_pressed = load("res://UI/" + "upgrade-pressed" + ".png")
			button.texture_disabled = load("res://UI/" + "upgrade-disabled" + ".png")
			
		pointDisplay.bbcode_text = "[center]" + str(display_info["points"]) + "[center]"
			

func update_info(event, slot, type = null): 
	var slots = display_info.slots;
	if event == "upgrade":
		if (display_info.points > 0):
			slots[slot]["level"] = slots[slot]["level"] + 1;
			display_info.points =  display_info.points - 1;
	else:
		if (display_info.points > 0):
			slots[slot]["level"] = 1;
			slots[slot]["type"] = type;
			display_info.points =  display_info.points - 1;
	update_display();
	return display_info;

func _on_Slot_Button_Pressed(button):
	var slot = button.name.trim_suffix("Button")
	var info = display_info["slots"][slot]
	var curr_display = displayGridContainer.get_node(slot + "Display")
	var selection_display = curr_display.get_node("SelectionContainer")
	if (info.type == null) :
#		change to selection display
		curr_display.texture = load("res://UI/" + "orb-selection-blank" + ".png")
		selection_display.visible = true;
		for button in selection_display.get_children():
			button.connect("pressed", self, "_on_Selection_Button_pressed", [button, slot])
			
		for slot_button in buttonGridContainer.get_children():
			slot_button.disabled = true;
	else:
		update_info("upgrade", slot)

func _on_Selection_Button_pressed(b, slot): 
	var type = b.name.trim_suffix("OrbSelect") + "_orb";
	
	b.get_parent().visible = false;
	for slot_button in buttonGridContainer.get_children():
		slot_button.disabled = false;
	update_info("unlock", slot, type);


func _on_CloseButton_pressed():
	emit_signal("close")
	pass # Replace with function body.
