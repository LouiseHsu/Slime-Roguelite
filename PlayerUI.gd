extends Control

onready var progressBar = $TextureProgress;
onready var expBar = $"EXP Bar";

# Called when the node enters the scene tree for the first time.
func _ready():

	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Player_damage_taken():
	progressBar.value = get_parent().get_health();
	pass # Replace with function body.


func _on_Player_player_ready():
	progressBar.max_value = get_parent().get_max_health();
	progressBar.value = get_parent().get_max_health();


func _on_Stats_update_exp_bar(curr, next):
	expBar.max_value = next;
	expBar.value = curr;
	pass # Replace with function body.
