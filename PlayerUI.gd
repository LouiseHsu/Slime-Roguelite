extends Control

onready var progressBar = $TextureProgress;
onready var expBar = $"EXP Bar";

func _on_Player_damage_taken():
	progressBar.value = get_parent().get_health();

func _on_Player_player_ready():
	progressBar.max_value = get_parent().get_max_health();
	progressBar.value = get_parent().get_max_health();

func _on_Stats_update_exp_bar(curr, next):
	expBar.max_value = next;
	expBar.value = curr;
