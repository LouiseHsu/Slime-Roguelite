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
	save_game();
	entity_order.clear_all();

func _on_MapGenerator_next_level():
	load_next_level();
	save_game();
	pass # Replace with function body.

func handle_input():
	if Input.is_action_just_released("Restart") :
		map_generator.reload_map();
		entity_order.clear_all();
	if Input.is_action_just_released("Load"):
		print("HI")
		entity_order.clear_all();
		load_game();
		
func save_game():
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

func load_game():
	var save_game = File.new()
	if not save_game.file_exists("res://savegame.json"):
		print("no save")
		return # Error! We don't have a save to load.

	# We need to revert the game state so we're not cloning objects
	# during loading. This will vary wildly depending on the needs of a
	# project, so take care with this step.
	# For our example, we will accomplish this by deleting saveable objects.
	var save_nodes = get_tree().get_nodes_in_group("Persistent_Objects")
	for i in save_nodes:
		i.queue_free()

	# Load the file line by line and process that dictionary to restore
	# the object it represents.
	save_game.open("user://savegame.save", File.READ)
	while save_game.get_position() < save_game.get_len():
		# Get the saved dictionary from the next line in the save file
		var node_data = parse_json(save_game.get_line())

		# Firstly, we need to create the object and add it to the tree and set its position.
		var new_object = load(node_data["filename"]).instance()
		get_node(node_data["parent"]).add_child(new_object)
		new_object.position = Vector2(node_data["pos_x"], node_data["pos_y"])

		# Now we set the remaining variables.
		for i in node_data.keys():
			if i == "filename" or i == "parent" or i == "pos_x" or i == "pos_y":
				continue
			new_object.set(i, node_data[i])

	save_game.close()
