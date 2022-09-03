extends Node2D

onready var map_generator = $MapGenerator;
onready var entity_order = $Entity_Order;
onready var player = $Entity_Order/Player;

func ready():
	map_generator.connect("next_level", self, "load_next_level")
	
func _process(delta):
	handle_input();

func load_next_level():
	print("hewwodasdasdasd")
	map_generator.load_next_map();
	save();
	entity_order.clear_all();

func _on_MapGenerator_next_level():
	load_next_level();
	save();
	pass # Replace with function body.

func handle_input():
	if Input.is_action_just_released("Restart") :
		map_generator.reload_map();
		entity_order.clear_all();
		
func save():
	print("saving")
	var save_game = File.new()
	save_game.open("res://savegame.json", File.WRITE)
	var save_nodes = get_tree().get_nodes_in_group("Persistent_Objects")
	for node in save_nodes:
		# Check the node is an instanced scene so it can be instanced again during load.
		if node.filename.empty():
			print("persistent node '%s' is not an instanced scene, skipped" % node.name)
			continue

		# Check the node has a save function.
		if !node.has_method("save"):
			print("persistent node '%s' is missing a save() function, skipped" % node.name)
			continue

		# Call the node's save function.
		var node_data = node.call("save")

		# Store the save dictionary as a new line in the save file.
		save_game.store_line(to_json(node_data))
	save_game.close()
